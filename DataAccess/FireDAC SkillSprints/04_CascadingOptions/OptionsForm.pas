{
  Âü°í ±Û : http://blog.hjf.pe.kr/339
}
unit OptionsForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Vcl.Grids, Vcl.DBGrids,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Moni.Base, FireDAC.Moni.Custom;

type
  TForm2 = class(TForm)
    EmpConnection: TFDConnection;
    qryEmployee: TFDQuery;
    dsEmployee: TDataSource;
    qryProject: TFDQuery;
    dsProject: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qryProjectPROJ_NAME: TStringField;
    qryProjectEMP_NO: TSmallintField;
    Splitter1: TSplitter;
    qryEmployeeEMP_NO: TSmallintField;
    qryEmployeeFIRST_NAME: TStringField;
    qryEmployeeLAST_NAME: TStringField;
    qryEmployeePHONE_EXT: TStringField;
    qryEmployeeHIRE_DATE: TSQLTimeStampField;
    qryEmployeeDEPT_NO: TStringField;
    qryEmployeeJOB_CODE: TStringField;
    qryEmployeeJOB_GRADE: TSmallintField;
    qryEmployeeJOB_COUNTRY: TStringField;
    qryEmployeeSALARY: TBCDField;
    qryEmployeeFULL_NAME: TStringField;
    Panel1: TPanel;
    chkFetchRowsetSize: TCheckBox;
    btnFetchNext: TButton;
    chkDetailDelay: TCheckBox;
    Button1: TButton;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure chkFetchRowsetSizeClick(Sender: TObject);
    procedure btnFetchNextClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure chkDetailDelayClick(Sender: TObject);
  private
    { Private declarations }
    FDetailSelectCount: Integer;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.btnFetchNextClick(Sender: TObject);
begin
  qryEmployee.FetchNext;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  qryEmployee.Close;
  qryEmployee.FetchOptions.RecsSkip := 10;
  qryEmployee.FetchOptions.RecsMax := 10;
  qryEmployee.Open;
end;

procedure TForm2.chkDetailDelayClick(Sender: TObject);
begin
  if TCheckBox(Sender).Checked then
    qryProject.FetchOptions.DetailDelay := StrToIntDef(Edit1.Text, 300)
  else
    qryProject.FetchOptions.DetailDelay := 0;
end;

procedure TForm2.chkFetchRowsetSizeClick(Sender: TObject);
begin
  qryEmployee.Close;
  if TCheckBox(Sender).Checked then
  begin
    qryEmployee.FetchOptions.RowsetSize := 3;
    qryEmployee.FetchOptions.Mode := TFDFetchMode.fmManual;
  end
  else
  begin
    qryEmployee.FetchOptions.Mode := TFDFetchMode.fmOnDemand;
  end;
  qryEmployee.Open;
  btnFetchNext.Enabled := TCheckBox(Sender).Checked;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  FDetailSelectCount := 0;

  qryProject.IndexFieldNames := 'EMP_NO';
  qryProject.MasterFields := 'EMP_NO';
  qryProject.MasterSource := dsEmployee;
end;

end.
