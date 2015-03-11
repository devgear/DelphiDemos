program ProjectArrayDML;

uses
  System.StartUpCopy,
  FMX.Forms,
  ArrayDMLForm in 'ArrayDMLForm.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
