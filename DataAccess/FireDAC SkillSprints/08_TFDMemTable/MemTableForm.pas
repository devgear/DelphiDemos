unit MemTableForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, FMX.StdCtrls, FMX.Memo, Data.Bind.Components,
  Data.Bind.Grid, FMX.Layouts, FMX.Grid, Data.Bind.DBScope, FireDAC.Stan.Intf;

type
  TForm1 = class(TForm)
    BindSourceDB1: TBindSourceDB;
    GridBindSourceDB1: TGrid;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingsList1: TBindingsList;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses MemTableModule;

procedure TForm1.Button1Click(Sender: TObject);
var
  StrStream: TStringStream;
begin
  StrStream := TStringStream.Create;
  try
    DM.FDMemTable1.SaveToStream(StrStream, sfJSON); // uses FireDAC.Stan.Intf
//    DM.FDMemTable1.SaveToFile(FilePath, sfJSON);
    DM.FDMemTable1.EmptyDataSet;
    Memo1.Lines.Text := StrStream.DataString;
  finally
    StrStream.Free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  StrStream: TStringStream;
begin
  StrStream := TStringStream.Create(Memo1.Lines.Text);
  try
    DM.FDMemTable1.LoadFromStream(StrStream, sfJSON); // uses FireDAC.Stan.Intf
//    DM.FDMemTable1.SaveToFile(FilePath, sfJSON);
  finally
    StrStream.Free;
  end;
end;

end.
