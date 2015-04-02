program ProjectTracingMonitoring;

uses
  Vcl.Forms,
  TraceMonForm in 'TraceMonForm.pas' {Form2},
  TraceMonModule in 'TraceMonModule.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
