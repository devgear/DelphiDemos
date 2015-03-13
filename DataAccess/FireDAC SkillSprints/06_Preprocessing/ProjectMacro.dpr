program ProjectMacro;

uses
  System.StartUpCopy,
  FMX.Forms,
  MacroForm in 'MacroForm.pas' {Form4},
  MacroModule in 'MacroModule.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
