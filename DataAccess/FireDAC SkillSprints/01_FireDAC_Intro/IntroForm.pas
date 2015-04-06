unit IntroForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TForm1 = class(TForm)
    CheckBox1: TCheckBox;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses IntroModule;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  DataModule1.FDTable1.Active := CheckBox1.Checked;
end;

end.
