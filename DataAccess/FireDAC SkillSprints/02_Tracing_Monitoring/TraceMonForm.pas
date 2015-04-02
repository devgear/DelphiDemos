{
  Âü°í ±Û : http://blog.hjf.pe.kr/328
}
unit TraceMonForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.VCLUI.Wait, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  Vcl.Bind.Grid, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, Vcl.StdCtrls,
  Vcl.Grids, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.ExtCtrls, FireDAC.Moni.Base,
  FireDAC.Moni.FlatFile, FireDAC.Moni.RemoteClient, Vcl.DBGrids;

type
  TForm2 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Memo1: TMemo;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Button3: TButton;
    Memo2: TMemo;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button4: TButton;
    Panel4: TPanel;
    Button5: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
    { Private declarations }
    procedure DBGridColumnAutoSize(ADBGrid: TDBGrid);
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses
  System.IOUtils, TraceMonModule;

procedure TForm2.Button1Click(Sender: TObject);
begin
  DM.FDMoniRemoteClientLink1.Tracing := False;
  DM.FDConnection1.Params.MonitorBy := TFDMonitorBy.mbRemote;
  DM.FDMoniRemoteClientLink1.Tracing := True;

  DM.FDTable1.Close;
  DM.FDTable1.Open;
{
  Memo1.Lines.Clear;
  MetaData := EmployeeConnection.ConnectionMetaDataIntf;

  Memo1.Lines.Add(MetaData.ServerVersion.ToString());
  Memo1.Lines.Add(MetaData.ClientVersion.ToString());

  DataView := MetaData.GetTables([TFDPhysObjectScope.osMy], [TFDPhysTableKind.tkTable], '', '', '');

  for I := 0 to DataView.Table.Columns.Count - 1 do
  begin
    Memo1.Lines.Add(DataView.Table.Columns[I].Name);
    Memo1.Lines.Add(DataView.Table.Columns[I].Caption);
  end;
  MetaData := nil;
}
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  DM.FDMoniFlatFileClientLink1.Tracing := False;
  DM.FDConnection1.Params.MonitorBy := TFDMonitorBy.mbFlatFile;
  DM.FDMoniFlatFileClientLink1.FileName := TPath.Combine(TPath.GetLibraryPath, 'trace.txt');
  DM.FDMoniFlatFileClientLink1.Tracing := True;

  DM.FDTable1.Close;
  DM.FDTable1.Open;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  DM.FDConnection1.GetInfoReport(Memo1.Lines)
end;

procedure TForm2.Button4Click(Sender: TObject);
var
  MetaType: string;
begin
  MetaType := (Sender as TButton).Caption;
  if MetaType = 'GetTableNames' then
    DM.FDConnection1.GetTableNames('', '', '', Memo2.Lines)
  else if MetaType = 'GetFieldNames' then
    DM.FDConnection1.GetFieldNames('', '', 'EMPLOYEE', '', Memo2.Lines)
  else if MetaType = 'GetGeneratorNames' then
    DM.FDConnection1.GetGeneratorNames('', '', '', Memo2.Lines)
  else if MetaType = 'GetStoredProcName' then
    DM.FDConnection1.GetStoredProcNames('', '', '', '', Memo2.Lines)
  ;
end;

procedure TForm2.Button5Click(Sender: TObject);
var
  MetaType: string;
begin
  DM.FDMetaInfoQuery1.Close;
  ///
  MetaType := (Sender as TButton).Caption;
  if MetaType = 'GetTableNames' then
    DM.FDMetaInfoQuery1.MetaInfoKind := TFDPhysMetaInfoKind.mkTables
  else if MetaType = 'GetFieldNames' then
  begin
    DM.FDMetaInfoQuery1.MetaInfoKind := TFDPhysMetaInfoKind.mkTableFields;
    DM.FDMetaInfoQuery1.ObjectName := 'EMPLOYEE';
  end
  else if MetaType = 'GetGeneratorNames' then
    DM.FDMetaInfoQuery1.MetaInfoKind := TFDPhysMetaInfoKind.mkGenerators
  else if MetaType = 'GetStoredProcName' then
    DM.FDMetaInfoQuery1.MetaInfoKind := TFDPhysMetaInfoKind.mkProcs
  ;
  ///
  DM.FDMetaInfoQuery1.Open;

  DBGridColumnAutoSize(DBGrid2);
end;

procedure TForm2.Button9Click(Sender: TObject);
begin
  DM.FDMetaInfoQuery1.Close;
  DM.FDMetaInfoQuery1.Open;

  DBGridColumnAutoSize(DBGrid2);
end;

procedure TForm2.DBGridColumnAutoSize(ADBGrid: TDBGrid);
var
  I: Integer;
begin
  for I := 0 to ADBGrid.Columns.Count - 1 do
    ADBGrid.Columns[I].Width := Canvas.TextWidth(ADBGrid.Columns[I].FieldName) + 30;
end;

end.
