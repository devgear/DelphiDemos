unit MacroModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.FMXUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.IBBase,
  FireDAC.Moni.Base, FireDAC.Moni.RemoteClient, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.ExprFuncs;

type
  TDM = class(TDataModule)
    FDConnection1: TFDConnection;
    qryTables: TFDQuery;
    FDMoniRemoteClientLink1: TFDMoniRemoteClientLink;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qryFields: TFDQuery;
    qrySelect: TFDQuery;
    qryMacroQuery: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

uses
  FMX.Dialogs;

procedure TDM.DataModuleCreate(Sender: TObject);
var
  DataDir: string;
begin
  DataDir := GetEnvironmentVariable('DEMOSDIR');
  if DataDir.IsEmpty then
  begin
    ShowMessage('DEMODIR 경로가 설정되지 않아 시작할 수 없습니다.');
    Exit;
  end;

  FDConnection1.LoginPrompt := False;
  FDConnection1.Params.Clear;
  FDConnection1.Params.Add('MonitorBy=Remote');
  FDConnection1.Params.Add('DriverID=IB');
  FDConnection1.Params.Add('Database=' + DataDir + '/data/dbdemos.gdb');
  FDConnection1.Params.Add('User_Name=sysdba');
  FDConnection1.Params.Add('Password=masterkey');
  FDConnection1.Connected := True;
  FDConnection1.ConnectionIntf.Tracing := True;

  qryTables.Open;
end;

end.
