unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    ComboBox1: TComboBox;
    Memo1: TMemo;
    Button2: TButton;
    Edit2: TEdit;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    PopupMenu1: TPopupMenu;
    N11: TMenuItem;
    N21: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Button5.DropDownMenu := PopupMenu1;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Edit1.Alignment := TAlignment (
    (Ord (Edit1.Alignment) + 1) mod (Ord(High(TAlignment)) + 1));

  PopupParent
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Edit2.CharCase := TEditCharCase (
    (Ord (Edit2.CharCase) + 1) mod (Ord(High(TEditCharCase)) + 1));
  Memo1.CharCase := TEditCharCase (
    (Ord (Memo1.CharCase) + 1) mod (Ord(High(TEditCharCase)) + 1));

  Edit2.Text := 'Humphery Kim';
  Memo1.Text := 'Humphery Kim';
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  ShowMessage('커맨드 링크 버튼도 일반버튼과 기능이 동일합니다.');
end;

procedure TForm1.ComboBox1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    ComboBox1.ItemIndex := -1;
end;

end.
