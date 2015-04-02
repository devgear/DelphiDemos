program ProjectCachedUpdateAutoInc;

uses
  Vcl.Forms,
  CachedUpdateForm in 'CachedUpdateForm.pas' {Form2},
  CachedUpdateModule in 'CachedUpdateModule.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
