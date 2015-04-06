program LocalSQLDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  LocalSQLUnit1 in 'LocalSQLUnit1.pas' {Form8};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm8, Form8);
  Application.Run;
end.
