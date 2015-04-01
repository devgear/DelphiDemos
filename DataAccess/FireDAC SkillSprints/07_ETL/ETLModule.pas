unit ETLModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Phys.MSSQLDef, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.IBDef,
  FireDAC.Phys.IB, FireDAC.Phys.IBBase, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.ODBCBase, FireDAC.Comp.UI, FireDAC.Comp.BatchMove.Text,
  FireDAC.Comp.BatchMove.DataSet, FireDAC.Comp.BatchMove, FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    FDQuery1: TFDQuery;
    FDBatchMoveDataSetReader1: TFDBatchMoveDataSetReader;
    FDBatchMoveDtoT: TFDBatchMove;
    FDBatchMoveTextWriter1: TFDBatchMoveTextWriter;
    FDQuery2: TFDQuery;
    FDBatchMoveDataSetWriter1: TFDBatchMoveDataSetWriter;
    FDBatchMoveTextReader1: TFDBatchMoveTextReader;
    FDQueryIB: TFDQuery;
    FDBatchMoveDataSetReader2: TFDBatchMoveDataSetReader;
    FDBatchMoveIBtoMSSQL: TFDBatchMove;
    FDQueryMSSQL: TFDQuery;
    FDBatchMoveDataSetWriter2: TFDBatchMoveDataSetWriter;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    FDConnectionMSSQL: TFDConnection;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDConnectionIB: TFDConnection;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    FDBatchMoveTtoD: TFDBatchMove;
    FDQueryIBData: TFDQuery;
    FDQueryMSData: TFDQuery;
    DataSource3: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Path1, Path2: string;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  System.IOUtils;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  Path1 := TPath.Combine(TPath.GetLibraryPath, 'partsbyvendors.csv');
  Path2 := TPath.Combine(TPath.GetLibraryPath, 'data.csv');

  FDBatchMoveTextWriter1.DataDef.WithFieldNames := True;
  FDBatchMoveTextWriter1.FileName := Path1;

  FDBatchMoveTextReader1.DataDef.WithFieldNames := True;
  FDBatchMoveTextReader1.FileName := Path2;

end;

end.
