unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, DataSnap.DSProviderDataModuleAdapter,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.FMXUI.Wait,
  Datasnap.Provider, FireDAC.Stan.StorageBin, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.FireDACJSONReflect,
  FireDAC.Moni.FlatFile, FireDAC.Moni.Base, FireDAC.Moni.RemoteClient;

type
{$METHODINFO ON}
  TServerMethods1 = class(TDataModule)
    FDConnectionEMPLOYEE: TFDConnection;
    FDQueryCUSTOMER: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDMoniRemoteClientLink1: TFDMoniRemoteClientLink;
  private
    { Private declarations }
  public
    { Public declarations }
    function GetCustomers: TFDJSONDataSets;
    procedure UpdateCustomers(ADeltas: TFDJSONDeltas);
  end;
{$METHODINFO OFF}

implementation

{$R *.dfm}


{ TServerMethods1 }

function TServerMethods1.GetCustomers: TFDJSONDataSets;
begin
  FDQueryCUSTOMER.Close;
  Result := TFDJSONDataSets.Create;

  TFDJSONDataSetsWriter.ListAdd(Result, 'CUSTOMER', FDQueryCUSTOMER);
end;

procedure TServerMethods1.UpdateCustomers(ADeltas: TFDJSONDeltas);
var
  Apply: IFDJSONDeltasApplyUpdates;
begin
  Apply := TFDJSONDeltasApplyUpdates.Create(ADeltas);
  Apply.ApplyUpdates('CUSTOMER', FDQueryCUSTOMER.Command);

  if Apply.Errors.Count > 0 then
    raise Exception.Create(Apply.Errors.Strings.Text);
end;

end.

