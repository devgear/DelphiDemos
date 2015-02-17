unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Button8: TButton;
    Button7: TButton;
    Button6: TButton;
    Button5: TButton;
    Button4: TButton;
    Button3: TButton;
    Button2: TButton;
    Button1: TButton;
    Button9: TButton;
    Button10: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
  CodeSiteLogging;

{$R *.dfm}

var
  Dest: TCodeSiteDestination;

procedure TForm2.Button10Click(Sender: TObject);
var
  Bmp: TBitmap;
begin
  Bmp := TBitmap.Create(Self);
  try

  finally
    Bmp.Free;
  end;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  // Tools > CodeSite > CodeSite Live Viewer
  CodeSite.Send('메시지 전송');
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  // css > ctrl + j
  CodeSite.Send( 'Width', Width );
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  // Viewer > View > Inspector
  CodeSite.Send('Form2', Form2);
  // 2회 전송 후 목록 2개 선택하면 변경된 항목만 표시
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
   CodeSite.Send( 'Screen.Fonts', Screen.Fonts );
   CodeSite.AddSeparator;
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  CodeSite.SendError('에러 정보 전송');
  CodeSite.SendNote('노트 내용 전송');
end;

procedure TForm2.Button6Click(Sender: TObject);
begin
  // template : csn, csx
  CodeSite.EnterMethod('Button6Click' );
  try
    CodeSite.Send('메시지 전송');
    CodeSite.Send('Form2', Form2);
    CodeSite.Send( 'Screen.Fonts', Screen.Fonts );
    CodeSite.SendError( '에러 정보 전송' );
    CodeSite.SendNote('노트 내용 전송');
  finally
    CodeSite.ExitMethod('Button6Click' );
  end;
end;

procedure TForm2.Button7Click(Sender: TObject);
begin
  CodeSite.EnterMethod( Self, 'Button7Click' );
  try
    if StrToInt('11a') > 0 then
      CodeSite.Send( 'True');
  except on E: Exception do
    CodeSite.SendException(E);
  end;
  CodeSite.ExitMethod( Self, 'Button7Click' );
end;

procedure TForm2.Button8Click(Sender: TObject);
begin
  CodeSite.Destination := Dest;
end;

procedure TForm2.Button9Click(Sender: TObject);
begin
  CodeSite.Destination := nil;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  // 파일저장 설정
  Dest := TCodeSiteDestination.Create(Application);
  Dest.LogFile.Active := True;
  Dest.LogFile.FileName := 'DemoLog.csl';
  Dest.LogFile.FilePath := '$(MyDocs)'; // 내문서에 저장
//  Dest.LogFile.MaxSize := 1024;
end;

end.
