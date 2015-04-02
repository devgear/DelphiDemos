unit TraceMonModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.UI, FireDAC.Comp.DataSet,
  FireDAC.Moni.RemoteClient, FireDAC.Moni.Base, FireDAC.Moni.FlatFile,
  FireDAC.Phys.IB, FireDAC.Phys.IBDef;

type
  TDM = class(TDataModule)
    FDMoniFlatFileClientLink1: TFDMoniFlatFileClientLink;
    FDMoniRemoteClientLink1: TFDMoniRemoteClientLink;
    FDMetaInfoQuery1: TFDMetaInfoQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDConnection1: TFDConnection;
    FDTable1: TFDTable;
    dsEmployee: TDataSource;
    dsMetadata: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
