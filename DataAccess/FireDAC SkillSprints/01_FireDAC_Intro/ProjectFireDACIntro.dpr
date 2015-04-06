program ProjectFireDACIntro;

uses
  Vcl.Forms,
  IntroForm in 'IntroForm.pas' {Form1},
  IntroModule in 'IntroModule.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
