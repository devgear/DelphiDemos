program ProjectDSClient;

uses
  System.StartUpCopy,
  FMX.Forms,
  MobileForm in 'MobileForm.pas' {Form2},
  dmDataAccess in 'dmDataAccess.pas' {DataModule1: TDataModule},
  ClientClassesUnit1 in 'ClientClassesUnit1.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
