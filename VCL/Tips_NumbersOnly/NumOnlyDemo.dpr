program NumOnlyDemo;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {Form2},
  Vcl.EditExtends in 'Vcl.EditExtends.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
