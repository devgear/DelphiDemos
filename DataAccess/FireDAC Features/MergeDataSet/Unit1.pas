unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  System.Rtti, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, FMX.Controls.Presentation,
  FMX.StdCtrls, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  FMX.Layouts, FMX.Grid, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TForm1 = class(TForm)
    memList: TFDMemTable;
    memListID: TIntegerField;
    memDetail: TFDMemTable;
    memMerge: TFDMemTable;
    memListName: TStringField;
    memDetailID: TIntegerField;
    memDetailName: TStringField;
    memDetailaddr: TStringField;
    Grid1: TGrid;
    Grid2: TGrid;
    Grid3: TGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    BindSourceDB3: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB3: TLinkGridToDataSource;
    Button1: TButton;
    Button3: TButton;
    memList2: TFDMemTable;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    Grid4: TGrid;
    BindSourceDB4: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB4: TLinkGridToDataSource;
    Button4: TButton;
    Button5: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  // 필드 추가
  memList.FieldDefs.Add('ID', ftInteger, 0, False);
  memList.FieldDefs.Add('Name', ftString, 20, False);
  memList.CreateDataSet;

  memList2.FieldDefs.Add('ID', ftInteger, 0, False);
  memList2.FieldDefs.Add('Name', ftString, 20, False);
  memList2.CreateDataSet;

  memDetail.FieldDefs.Add('ID', ftInteger, 0, False);
  memDetail.FieldDefs.Add('Name', ftString, 20, False);
  memDetail.FieldDefs.Add('addr', ftString, 50, False);
  memDetail.CreateDataSet;

  // 데이터 추가
  memList.Open;
  memList.AppendRecord([1, '김현수']);
  memList.AppendRecord([2, '홍길동']);
  memList.AppendRecord([3, '유관순']);

  memList2.Open;
  memList2.AppendRecord([4, '김원경']);
  memList2.AppendRecord([5, '박범용']);

  memDetail.Open;
  memDetail.AppendRecord([1, '김현수', '인천']);

  // Field 복사: 미리 복사하지 않으면 Detail 머지 시 PK 설정되지 않음
  memMerge.MergeDataSet(memDetail, dmNone, mmMerge);
  // PK 없으면 'no destination key defined' 오류 발생
  memMerge.Table.PrimaryKey := memDetail.Table.PrimaryKey;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  memMerge.MergeDataSet(memList, dmDataMerge, mmNone);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  memMerge.MergeDataSet(memList2, dmDataMerge, mmNone);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  memMerge.MergeDataSet(memDetail, dmDataMerge, mmNone);
end;

end.
