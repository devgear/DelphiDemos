unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  Vcl.EditExtends;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Button2: TButton;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}
// Edit.NumbersOnly := True;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Edit1.PlainText := '12345678901';
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  ShowMessage(Edit1.PlainText);
end;

end.
