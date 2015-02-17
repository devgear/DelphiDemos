unit dmDataAccess;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, IPPeerClient, Datasnap.DSClientRest, ClientclassesUnit1,
  Data.FireDACJSONReflect;

type
  TDataModule1 = class(TDataModule)
    FDMemTableCustomer: TFDMemTable;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    DSRestConnection1: TDSRestConnection;
  private
    FClient: TServermethods1Client;
    function GetServerMethods: TServerMethods1Client;
    { Private declarations }
  public
    { Public declarations }
    procedure GetCustomers;
    procedure ApplyCustomers;
    property ServerMethods: TServerMethods1Client read GetServerMethods;
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TDataModule1.ApplyCustomers;
var
  DeltaList: TFDJSONDeltas;
begin
  DeltaList := TFDJSONDeltas.Create;

  if FDMemTableCustomer.State in dsEditModes then
    FDMemTableCustomer.Post;

  TFDJSONDeltasWriter.ListAdd(DeltaList, 'CUSTOMER', FDMemTableCustomer);
  ServerMethods.UpdateCustomers(DeltaList);
end;

procedure TDataModule1.GetCustomers;
var
  DataSetLists: TFDJSONDataSets;
begin
  DataSetLists := ServerMethods.GetCustomers;
  FDMemTableCustomer.Active := False;
  FDMemTableCustomer.AppendData(
    TFDJSONDataSetsReader.GetListValue(DataSetLists, 0));
end;

function TDataModule1.GetServerMethods: TServerMethods1Client;
begin
  if FClient = nil then
    FClient := TServerMethods1Client.Create(DSRestConnection1);

  Result := FClient;
end;

end.
