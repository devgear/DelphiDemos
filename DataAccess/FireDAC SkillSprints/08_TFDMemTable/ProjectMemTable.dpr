program ProjectMemTable;

uses
  System.StartUpCopy,
  FMX.Forms,
  MemTableForm in 'MemTableForm.pas' {Form1},
  MemTableModule in 'MemTableModule.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
