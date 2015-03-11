{
  참고 글 : http://blog.hjf.pe.kr/336
}
unit CachedUpdateForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.VCLUI.Wait, Vcl.ExtCtrls, Vcl.DBCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.UI, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDQuery1SEQ: TIntegerField;
    FDQuery1FIELD1: TWideStringField;
    FDQuery1FIELD2: TIntegerField;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    DBNavigator1: TDBNavigator;
    GroupBox1: TGroupBox;
    btnCancelRefresh: TButton;
    btnApplyUpdates: TButton;
    chkUseCachedUpdates: TCheckBox;
    Label1: TLabel;
    chkUseAutoGenerateValue: TCheckBox;
    FDTable1: TFDTable;
    procedure btnCancelRefreshClick(Sender: TObject);
    procedure btnApplyUpdatesClick(Sender: TObject);
    procedure chkUseCachedUpdatesClick(Sender: TObject);
    procedure chkUseAutoGenerateValueClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

// <실행전 주의>
 // SAMPLE.GDB파일을 FDConnection1 > Database에 설정
procedure TForm2.chkUseAutoGenerateValueClick(Sender: TObject);
begin
  // SEQ 필드는 PK(자동증가) 값으로 설정됨
  FDQuery1.Close;
  if chkUseAutoGenerateValue.Checked then
  begin
    FDQuery1SEQ.AutoGenerateValue := arAutoInc;
    FDQuery1SEQ.Required := False;
    FDQuery1SEQ.ReadOnly := True;
    // 새로운 레코드 추가 시 SEQ가 (-1 -> -2 -> -3 으로 자동 생성됨)
  end
  else
  begin
    FDQuery1SEQ.AutoGenerateValue := arNone;
    FDQuery1SEQ.Required := True;
    FDQuery1SEQ.ReadOnly := False;
    // 새로운 레코드 추가 시 NULL로 설정됨(수동 설정 필요)
    // 저장(Post) 시 'Must have a value' 오류 발생
  end;
  FDQuery1.Open;
end;

procedure TForm2.chkUseCachedUpdatesClick(Sender: TObject);
var
  UseCachedUpdates: Boolean;
begin
  UseCachedUpdates := chkUseCachedUpdates.Checked;

  FDQuery1.CachedUpdates := UseCachedUpdates;

  btnCancelRefresh.Enabled := UseCachedUpdates;
  btnApplyUpdates.Enabled := UseCachedUpdates;
end;

procedure TForm2.btnCancelRefreshClick(Sender: TObject);
begin
  FDQuery1.CancelUpdates;
  FDQuery1.Refresh;
end;

procedure TForm2.btnApplyUpdatesClick(Sender: TObject);
var
  iErr: Integer;
begin
  FDConnection1.StartTransaction;

  // ApplyUpdates는 오류를 발생하지 않음
  iErr := FDQuery1.ApplyUpdates(-1);
  if iErr = 0 then
  begin
    FDQuery1.CommitUpdates; // 변경로그 지우기
    FDConnection1.Commit;
  end
  else
    FDConnection1.Rollback;

  FDQuery1.Refresh;
end;

end.
