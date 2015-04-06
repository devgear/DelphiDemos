unit LocalSQLUnit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  Data.DBXInterBase, Data.FMTBcd, IPPeerClient, IBX.IBDatabase, Vcl.DBLogDlg,
  IBX.IBCustomDataSet, IBX.IBTable, Datasnap.DBClient, REST.Response.Adapter,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, Data.DB,
  Data.SqlExpr, FMX.StdCtrls, System.Rtti, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Bind.Grid, FMX.Layouts,
  FMX.Grid, Data.Bind.DBScope, FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, FireDAC.DApt,
  FireDAC.Phys.SQLiteVDataSet, FireDAC.Comp.UI, Data.Win.ADODB, FMX.Memo;

type
  TForm8 = class(TForm)
    GroupBox1: TGroupBox;
    DbxConnection: TSQLConnection;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTAdapter: TRESTResponseDataSetAdapter;
    CDSREST: TClientDataSet;
    GroupBox2: TGroupBox;
    IBDatabase1: TIBDatabase;
    SalesTable: TIBTable;
    IBTransaction1: TIBTransaction;
    GroupBox3: TGroupBox;
    CustomersTable: TSQLTable;
    RestSalesReps: TFDMemTable;
    GroupBox4: TGroupBox;
    CDSRESTid: TWideStringField;
    CDSRESTname: TWideStringField;
    CDSRESTusername: TWideStringField;
    CDSRESTemail: TWideStringField;
    CDSRESTaddress: TWideStringField;
    CDSRESTphone: TWideStringField;
    CDSRESTwebsite: TWideStringField;
    CDSRESTcompany: TWideStringField;
    RestSalesRepsRestID: TIntegerField;
    RestSalesRepsSales_REP: TIntegerField;
    FDConnection1: TFDConnection;
    GroupBox5: TGroupBox;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDLocalSQL1: TFDLocalSQL;
    FDQuery1: TFDQuery;
    RegionsTable: TADOQuery;
    ADOConnection1: TADOConnection;
    Button1: TButton;
    GroupBox6: TGroupBox;
    RegionsTableRegionID: TIntegerField;
    RegionsTableRegionDescription: TWideStringField;
    Memo1: TMemo;
    BindSourceDB1: TBindSourceDB;
    GridBindSourceDB1: TGrid;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.fmx}

procedure TForm8.Button1Click(Sender: TObject);
begin
  RestSalesReps.EmptyDataSet;
  RestSalesReps.Open;
  RestSalesReps.AppendRecord([1, 11 ]);
  RestSalesReps.AppendRecord([2, 61 ]);
  RestSalesReps.AppendRecord([3, 127]);
  RestSalesReps.AppendRecord([4, 72 ]);
  RestSalesReps.AppendRecord([5, 134]);
  //MemSalesReps.SaveToFile('MemSalesReps.json', sfJSON);
end;

end.
