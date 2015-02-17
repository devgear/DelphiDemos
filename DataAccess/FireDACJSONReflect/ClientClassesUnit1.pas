//
// Created by the DataSnap proxy generator.
// 2015-02-03 ¿ÀÈÄ 9:32:39
// 

unit ClientClassesUnit1;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;

  TServerMethods1Client = class(TDSAdminRestClient)
  private
    FGetCustomersCommand: TDSRestCommand;
    FGetCustomersCommand_Cache: TDSRestCommand;
    FUpdateCustomersCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetCustomers(const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetCustomers_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    procedure UpdateCustomers(ADeltas: TFDJSONDeltas);
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;

const
  TServerMethods1_GetCustomers: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethods1_GetCustomers_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_UpdateCustomers: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'ADeltas'; Direction: 1; DBXType: 37; TypeName: 'TFDJSONDeltas')
  );

implementation

function TServerMethods1Client.GetCustomers(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetCustomersCommand = nil then
  begin
    FGetCustomersCommand := FConnection.CreateCommand;
    FGetCustomersCommand.RequestType := 'GET';
    FGetCustomersCommand.Text := 'TServerMethods1.GetCustomers';
    FGetCustomersCommand.Prepare(TServerMethods1_GetCustomers);
  end;
  FGetCustomersCommand.Execute(ARequestFilter);
  if not FGetCustomersCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetCustomersCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetCustomersCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetCustomersCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.GetCustomers_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetCustomersCommand_Cache = nil then
  begin
    FGetCustomersCommand_Cache := FConnection.CreateCommand;
    FGetCustomersCommand_Cache.RequestType := 'GET';
    FGetCustomersCommand_Cache.Text := 'TServerMethods1.GetCustomers';
    FGetCustomersCommand_Cache.Prepare(TServerMethods1_GetCustomers_Cache);
  end;
  FGetCustomersCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetCustomersCommand_Cache.Parameters[0].Value.GetString);
end;

procedure TServerMethods1Client.UpdateCustomers(ADeltas: TFDJSONDeltas);
begin
  if FUpdateCustomersCommand = nil then
  begin
    FUpdateCustomersCommand := FConnection.CreateCommand;
    FUpdateCustomersCommand.RequestType := 'POST';
    FUpdateCustomersCommand.Text := 'TServerMethods1."UpdateCustomers"';
    FUpdateCustomersCommand.Prepare(TServerMethods1_UpdateCustomers);
  end;
  if not Assigned(ADeltas) then
    FUpdateCustomersCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FUpdateCustomersCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FUpdateCustomersCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ADeltas), True);
      if FInstanceOwner then
        ADeltas.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FUpdateCustomersCommand.Execute;
end;

constructor TServerMethods1Client.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerMethods1Client.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerMethods1Client.Destroy;
begin
  FGetCustomersCommand.DisposeOf;
  FGetCustomersCommand_Cache.DisposeOf;
  FUpdateCustomersCommand.DisposeOf;
  inherited;
end;

end.
