{
  참고 글 : http://blog.hjf.pe.kr/338
}
unit ArrayDMLForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FMX.StdCtrls, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.FMXUI.Wait, FireDAC.Comp.UI,
  FMX.Layouts, FMX.Memo;

type
  TForm2 = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    Button1: TButton;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    Button3: TButton;
    Button2: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

uses
  System.Diagnostics;

const
  NUM_INSERTS = 10000;

procedure TForm2.Button1Click(Sender: TObject);
var
  I: Integer;
  StopWatch: TStopwatch;
begin
  FDConnection1.ExecSQL('DELETE FROM Test');

  StopWatch := TStopWatch.StartNew;

  for I := 0 to NUM_INSERTS - 1 do
  begin
    FDQuery1.ParamByName('Field1').AsInteger := I;
    FDQUery1.ParamByName('Field2').AsString := 'Str' + I.ToString;
    FDQuery1.ExecSQL;
  end;

  StopWatch.Stop;
  Memo1.Lines.Add('Insert STD : ' + StopWatch.ElapsedMilliseconds.ToString + ' ms');
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  I: Integer;
  StopWatch: TStopwatch;
begin
  FDConnection1.ExecSQL('DELETE FROM Test');

  StopWatch := TStopWatch.StartNew;

  // Transaction 추가
  FDConnection1.StartTransaction;
  try
    for I := 0 to NUM_INSERTS - 1 do
    begin
      FDQuery1.ParamByName('Field1').AsInteger := I;
      FDQUery1.ParamByName('Field2').AsString := 'Str' + I.ToString;
      FDQuery1.ExecSQL;
    end;
  finally
    FDConnection1.Commit;
  end;

  StopWatch.Stop;
  Memo1.Lines.Add('Insert STD(Transaction) : ' + StopWatch.ElapsedMilliseconds.ToString + ' ms');
end;

procedure TForm2.Button3Click(Sender: TObject);
var
  I: Integer;
  StopWatch: TStopwatch;
begin
  FDConnection1.ExecSQL('DELETE FROM Test');

  StopWatch := TStopWatch.StartNew;

  FDConnection1.StartTransaction;
  try
    FDQuery1.Params.ArraySize := NUM_INSERTS;
    for I := 0 to NUM_INSERTS - 1 do
    begin
      FDQuery1.ParamByName('Field1').AsIntegers[I] := I;
      FDQUery1.ParamByName('Field2').AsStrings[I] := 'Str' + I.ToString;
    end;
    FDQuery1.Execute(NUM_INSERTS);
  finally
    FDConnection1.Commit;
  end;

  StopWatch.Stop;
  Memo1.Lines.Add('Insert ArrayDML : ' + StopWatch.ElapsedMilliseconds.ToString + ' ms');
end;

end.
