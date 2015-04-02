unit CachedUpdateModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.UI, FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDQuery1SEQ: TIntegerField;
    FDQuery1FIELD1: TWideStringField;
    FDQuery1FIELD2: TIntegerField;
    FDQuery1Status: TStringField;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    dsData: TDataSource;
    FDMemTable1: TFDMemTable;
    dsCache: TDataSource;
    FDMemTable1Status: TStringField;
    FDMemTable1SEQ: TIntegerField;
    FDMemTable1FIELD1: TWideStringField;
    FDMemTable1FIELD2: TIntegerField;
    procedure FDQuery1CalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
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

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  // Auto-Inc 설정
  FDQuery1SEQ.AutoGenerateValue := arAutoInc;
  FDQuery1SEQ.Required := False;
  FDQuery1SEQ.ReadOnly := True;

  // CachedUpdates 설정
  FDQuery1.CachedUpdates := True;
end;

procedure TDM.FDQuery1CalcFields(DataSet: TDataSet);
begin
  case Dataset.UpdateStatus of
    usUnmodified : Dataset.FieldByName('Status').AsString := 'Unmodified';
    usModified   : Dataset.FieldByName('Status').AsString := 'Modified';
    usInserted   : Dataset.FieldByName('Status').AsString := 'Inserted';
    usDeleted    : Dataset.FieldByName('Status').AsString := 'Deleted';
  end;
end;

end.
