unit ETLForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.Comp.BatchMove.Text, FireDAC.Comp.BatchMove,
  FireDAC.Comp.BatchMove.DataSet, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, Vcl.StdCtrls, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.IBBase, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Grids, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  Vcl.DBGrids;

type
  TForm2 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Splitter1: TSplitter;
    Button4: TButton;
    Button5: TButton;
    Memo1: TMemo;
    Button6: TButton;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Splitter2: TSplitter;
    GroupBox3: TGroupBox;
    Button7: TButton;
    GroupBox4: TGroupBox;
    Button8: TButton;
    Button9: TButton;
    DBGrid2: TDBGrid;
    Memo2: TMemo;
    Panel1: TPanel;
    Splitter3: TSplitter;
    GroupBox5: TGroupBox;
    Button10: TButton;
    GroupBox6: TGroupBox;
    Button11: TButton;
    Button12: TButton;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses
  System.IOUtils, ETLModule;

procedure TForm2.Button1Click(Sender: TObject);
begin
  DM.FDBatchMoveDtoT.Execute;
  ShowMessage('완료');
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
//  DM.FDBatchMoveTtoD.Execute;
  DM.FDBatchMoveTtoD.Execute;
  ShowMessage('완료');
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  DM.FDBatchMoveIBtoMSSQL.Execute;
  ShowMessage('완료');
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  DM.FDQuery1.Open;
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
  if not FileExists(DM.Path1) then
  begin
    ShowMessage('파일이 없습니다.');
    Exit;
  end;
  Memo1.Lines.LoadFromFile(DM.Path1);
end;

procedure TForm2.Button6Click(Sender: TObject);
begin
  if FileExists(DM.Path1) then
    DeleteFile(DM.Path1);
  Memo1.Lines.Clear;
end;

procedure TForm2.Button7Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
  if not FileExists(DM.Path2) then
  begin
    ShowMessage('파일이 없습니다.');
    Exit;
  end;
  Memo2.Lines.LoadFromFile(DM.Path2);
end;

procedure TForm2.Button8Click(Sender: TObject);
begin
  if DM.FDQueryIBData.Active then
    DM.FDQueryIBData.Refresh
  else
    DM.FDQueryIBData.Open;
end;

procedure TForm2.Button9Click(Sender: TObject);
begin
  DM.FDConnectionIB.ExecSQL('DELETE FROM DATA');
  DM.FDQueryIBData.Refresh;
  ShowMessage('삭제했습니다.');
end;

procedure TForm2.Button11Click(Sender: TObject);
begin
  if DM.FDQueryMSData.Active then
    DM.FDQueryMSData.Refresh
  else
    DM.FDQueryMSData.Open;
end;

procedure TForm2.Button12Click(Sender: TObject);
begin
  DM.FDConnectionMSSQL.ExecSQL('DELETE FROM DATA');
  DM.FDQueryMSData.Refresh;
  ShowMessage('삭제했습니다.');
end;

end.
