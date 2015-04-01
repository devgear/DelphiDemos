program ProjectETL;

uses
  Vcl.Forms,
  ETLForm in 'ETLForm.pas' {Form2},
  ETLModule in 'ETLModule.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
