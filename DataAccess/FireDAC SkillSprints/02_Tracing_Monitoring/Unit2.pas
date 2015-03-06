{
  Âü°í ±Û : http://blog.hjf.pe.kr/328
}
unit Unit2;

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
  FireDAC.Moni.FlatFile, FireDAC.Moni.RemoteClient;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    EmployeeConnection: TFDConnection;
    EmployeeTable: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    StringGrid1: TStringGrid;
    Memo1: TMemo;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    FDMoniFlatFileClientLink1: TFDMoniFlatFileClientLink;
    FDMoniRemoteClientLink1: TFDMoniRemoteClientLink;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
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
  System.IOUtils;

procedure TForm2.Button1Click(Sender: TObject);
var
  MetaData: IFDPhysConnectionMetadata;
  DataView: TFDDatSView;
  I: Integer;
begin
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
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
  EmployeeConnection.GetInfoReport(Memo1.Lines)
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  FDMoniFlatFileClientLink1.FileName := TPath.Combine(TPath.GetLibraryPath, 'trace.txt');
  FDMoniFlatFileClientLink1.Tracing := True;
  BindSourceDB1.DataSet.Active := True;
end;

end.
