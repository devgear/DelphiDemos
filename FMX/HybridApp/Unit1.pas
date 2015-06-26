unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.WebBrowser, System.RTTI;

type
  TForm1 = class(TForm)
    WebBrowser1: TWebBrowser;
    ToolBar1: TToolBar;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure WebBrowser1ShouldStartLoadWithRequest(ASender: TObject;
      const URL: string);
    procedure Button2Click(Sender: TObject);
    procedure WebBrowser1DidStartLoad(ASender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function CallMethod(AMethodName: string; AParameters: TArray<TValue>): TValue;
    function ProcessMethodUrlParse(AUrl: string; var MethodName: string; var Parameters: TArray<TValue>): Boolean;
  public
    { Private declarations }
    procedure callDelphiMethodFromJS;
    procedure callDelphiMethodFromJSWithParam(AStr1, AStr2: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  System.NetEncoding;


procedure TForm1.FormCreate(Sender: TObject);
begin
  WebBrowser1.URL := 'http://hjf.pe.kr/fmx/hybrid.php';
  WebBrowser1.Navigate;
end;

// 델파이에서 JavaScript 실행
procedure TForm1.Button1Click(Sender: TObject);
begin
  WebBrowser1.EvaluateJavaScript('callJSMethodFromDelphi();');
end;

// 웹페이지에서 호출하는 델파이 메소드
procedure TForm1.Button2Click(Sender: TObject);
begin
  if WebBrowser1.CanGoBack then
    WebBrowser1.GoBack;
end;

procedure TForm1.callDelphiMethodFromJS;
begin
  ShowMessage('[DELPHI] Call from JS');
end;

procedure TForm1.callDelphiMethodFromJSWithParam(AStr1, AStr2: string);
begin
  ShowMessage(Format('[DELPHI] Call from JS(%s, %s)', [AStr1, AStr2]));
end;

function TForm1.CallMethod(AMethodName: string; AParameters: TArray<TValue>): TValue;
{
// IF문을 사용하는 방식
begin
  if AMethodName = 'callDelphiMethodFromJS' then
    callDelphiMethodFromJS
  else if AMethodName = 'callDelphiMethodFromJSWithParam' then
    callDelphiMethodFromJSWithParam(AParameters[0].AsString, AParameters[1].AsString);
end;
}
// RTTI로 메소드이름으로 메소드 호출하는 방식(published, public 으로 메소드가 선언되야함)
var
  RttiCtx: TRttiContext;
  RttiTyp: TRttiType;
  RttiMtd: TRttiMethod;
begin
  RttiCtx := TRttiContext.Create;
  RttiTyp := RttiCtx.GetType(Self.ClassInfo);
  if Assigned(RttiTyp) then
  begin
    RttiMtd := RttiTyp.GetMethod(AMethodName);
    if Assigned(RttiMtd) then
      Result := RttiMtd.Invoke(Self, AParameters);
  end;
  RttiMtd.Free;
  RttiTyp.Free;
  RttiCtx.Free;
end;


// URL format
//  jscall://{method name}?{Param1}|{ParamN}
//  e.g> jscall://callDelphiMethodFromJSWithParam?Hello|1234
function TForm1.ProcessMethodUrlParse(AUrl: string;
  var MethodName: string; var Parameters: TArray<TValue>): Boolean;
const
  JSCALL_PREFIX = 'jscall://';
  JSCALL_PREFIX_LEN = Length(JSCALL_PREFIX);
var
  I: Integer;
  ParamStr: string;
  ParamArray: TArray<string>;
begin
  Result := False;

  // iOS에서 특수기호(|)가 멀티바이트로 넘어옴
  AUrl := TNetEncoding.URL.Decode(AUrl);

  if AUrl.IndexOf(JSCALL_PREFIX) = -1 then
    Exit(False);

  if AUrl.IndexOf('?') > 0 then
  begin
    MethodName := AUrl.Substring(JSCALL_PREFIX_LEN, AUrl.IndexOf('?')-JSCALL_PREFIX_LEN);

    ParamStr := AUrl.Substring(AUrl.IndexOf('?')+1, Length(AUrl));
    ParamArray := ParamStr.Split(['|']);
    SetLength(Parameters, length(ParamArray));
    for I := 0 to Length(ParamArray)-1 do
      Parameters[I] := ParamArray[I];
  end
  else
    MethodName := AUrl.Substring(JSCALL_PREFIX_LEN, MaxInt);
  if MethodName.IndexOf('/') > 0 then
    MethodName := MethodName.Replace('/', '');

  Result := not MethodName.IsEmpty;
end;

procedure TForm1.WebBrowser1DidStartLoad(ASender: TObject);
var
  URL: string;
  MethodName: string;
  Params: TArray<TValue>;
begin
{$IFDEF MSWINDOWS}
  URL := WebBrowser1.URL;
  if ProcessMethodUrlParse(URL, MethodName, Params) then
  begin
    CallMethod(MethodName, Params);
  end;
{$ENDIF}
end;

procedure TForm1.WebBrowser1ShouldStartLoadWithRequest(ASender: TObject;
  const URL: string);
var
  MethodName: string;
  Params: TArray<TValue>;
begin
  if ProcessMethodUrlParse(URL, MethodName, Params) then
  begin
    CallMethod(MethodName, Params);
  end;
end;

end.
