unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm5 = class(TForm)
    TaskDialog1: TTaskDialog;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    Button1: TButton;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    RadioGroup1: TRadioGroup;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    Edit1: TEdit;
    CheckBox8: TCheckBox;
    Edit2: TEdit;
    Edit3: TEdit;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    Edit4: TEdit;
    CheckBox12: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure TaskDialog1VerificationClicked(Sender: TObject);
    procedure TaskDialog1RadioButtonClicked(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

uses
  StrUtils;

procedure TForm5.Button1Click(Sender: TObject);
var
  ButtonItem: TTaskDialogButtonItem;
begin
  With TaskDialog1 do
  begin
    // 기본정보
    Caption   := LabeledEdit1.Text;
    Title     := LabeledEdit2.Text;
    Text      := LabeledEdit3.Text + #13#10 + '두줄쓰기';

    // 자세한 정보
    ExpandedText        := LabeledEdit4.Text;
    ExpandButtonCaption := LabeledEdit5.Text;

    // 버튼 표시하기
    while Buttons.Count > 0 do
      Buttons.Items[0].Free;
    CommonButtons := [];
    if CheckBox1.Checked then CommonButtons := CommonButtons + [tcbOk];
    if CheckBox2.Checked then CommonButtons := CommonButtons + [tcbYes];
    if CheckBox3.Checked then CommonButtons := CommonButtons + [tcbNo];
    if CheckBox4.Checked then CommonButtons := CommonButtons + [tcbCancel];
    if CheckBox5.Checked then CommonButtons := CommonButtons + [tcbRetry];
    if CheckBox6.Checked then CommonButtons := CommonButtons + [tcbClose];
    if CheckBox7.Checked then Buttons.Add.Caption := '사용자 버튼';

    // 메인 아이콘
    MainIcon := RadioGroup1.ItemIndex;

    // 하단 텍스트
    FooterText := IfThen(CheckBox8.Checked, Edit2.Text, '');

    // 확인 체크박스
    VerificationText := IfThen(CheckBox9.Checked, Edit3.Text, '');

    // Radio Buttons
    while RadioButtons.Count > 0 do
      RadioButtons.Items[0].Free;
    if CheckBox10.Checked then
    begin
      RadioButtons.Add.Caption := '델파이';
      RadioButtons.Add.Caption := 'C++ 빌더';
      RadioButtons.Add.Caption := 'RAD Studio';
    end;

    // CommandLink
    Flags := Flags - [tfUseCommandLinks];
    if CheckBox11.Checked then
    begin
      Flags := Flags + [tfUseCommandLinks];
      while Buttons.Count > 0 do
        Buttons.Items[0].Free;
      ButtonItem := Buttons.Add as TTaskDialogButtonItem;
      ButtonItem.Caption := '델파이';
      ButtonItem.CommandLinkHint := 'Object Pascal';
      ButtonItem := Buttons.Add as TTaskDialogButtonItem;
      ButtonItem.Caption := 'C++ 빌더';
      ButtonItem.CommandLinkHint := 'C++';
      ButtonItem := Buttons.Add as TTaskDialogButtonItem;
      ButtonItem.Caption := 'RAD Studio';
      ButtonItem.CommandLinkHint := 'Object Pascal/C++';
    end;

    // Statusbar 표시
    Flags := Flags - [tfShowprogressBar];
    if CheckBox12.Checked then
    begin
      Flags := Flags + [tfShowprogressBar];
      TaskDialog1.ProgressBar.Position := 80;
    end;
  end;

  // TaskDialog 실행
  if TaskDialog1.Execute then
    Edit1.Text := Integer(TaskDialog1.ModalResult).ToString;
end;

procedure TForm5.TaskDialog1RadioButtonClicked(Sender: TObject);
begin
  Edit4.Text := TaskDialog1.RadioButtons[TaskDialog1.RadioButton.Index].Caption;
end;

procedure TForm5.TaskDialog1VerificationClicked(Sender: TObject);
begin
  if tfVerificationFlagChecked in TaskDialog1.Flags then
    CheckBox9.Font.Style := [fsBold]
  else
    CheckBox9.Font.Style := [];
end;

end.
