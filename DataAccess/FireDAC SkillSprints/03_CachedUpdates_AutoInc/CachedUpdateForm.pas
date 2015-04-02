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
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBGrid2: TDBGrid;
    btnViewCache: TButton;
    btnApplyUpdates: TButton;
    btnCancelUpdates: TButton;
    Label1: TLabel;
    btnOldValue: TButton;
    btnLastUndo: TButton;
    btnRevertRecord: TButton;
    btnSavePoint: TButton;
    btnBackSPoint: TButton;
    procedure btnCancelUpdatesClick(Sender: TObject);
    procedure btnApplyUpdatesClick(Sender: TObject);
    procedure btnViewCacheClick(Sender: TObject);
    procedure btnOldValueClick(Sender: TObject);
    procedure btnLastUndoClick(Sender: TObject);
    procedure btnRevertRecordClick(Sender: TObject);
    procedure btnSavePointClick(Sender: TObject);
    procedure btnBackSPointClick(Sender: TObject);
  private
    { Private declarations }
    FSavePoint: Integer;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses CachedUpdateModule;

procedure TForm2.btnCancelUpdatesClick(Sender: TObject);
begin
  DM.FDQuery1.CancelUpdates;
  DM.FDQuery1.Refresh;
end;

procedure TForm2.btnLastUndoClick(Sender: TObject);
begin
  DM.FDQuery1.UndoLastChange(True);
end;

procedure TForm2.btnOldValueClick(Sender: TObject);
begin
  ShowMessage(format('이전 값: %s  ->  새로운 값: %s',
                     [
                      DM.FDQuery1.FieldByName('FIELD1').OldValue,
                      DM.FDQuery1.FieldByName('FIELD1').Value
                     ]));
end;

procedure TForm2.btnRevertRecordClick(Sender: TObject);
begin
  DM.FDQuery1.RevertRecord;
end;

procedure TForm2.btnSavePointClick(Sender: TObject);
begin
  FSavePoint := DM.FDQuery1.SavePoint;
end;

procedure TForm2.btnViewCacheClick(Sender: TObject);
begin
  if DM.FDQuery1.Active then
  begin
    DM.FDMemTable1.CloneCursor(DM.FDQuery1, True);
    DM.FDMemTable1.FilterChanges := [rtModified, rtInserted, rtDeleted];
  end;
end;

procedure TForm2.btnApplyUpdatesClick(Sender: TObject);
var
  iErr: Integer;
begin
  DM.FDConnection1.StartTransaction;

  // ApplyUpdates는 오류를 발생하지 않음
  iErr := DM.FDQuery1.ApplyUpdates(-1);
  if iErr = 0 then
  begin
    DM.FDQuery1.CommitUpdates; // 변경로그 지우기
    DM.FDConnection1.Commit;
  end
  else
    DM.FDConnection1.Rollback;

  DM.FDQuery1.Refresh;
end;

procedure TForm2.btnBackSPointClick(Sender: TObject);
begin
  if FSavePoint > 0 then
    DM.FDQuery1.SavePoint := FSavePoint;
end;

end.
