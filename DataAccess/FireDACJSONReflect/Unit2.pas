unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Layouts, FMX.Grid, FMX.StdCtrls, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope;

type
  TForm2 = class(TForm)
    ToolBar1: TToolBar;
    SpeedButtonRefresh: TSpeedButton;
    SpeedButtonApplyUpdates: TSpeedButton;
    Grid1: TGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    procedure SpeedButtonRefreshClick(Sender: TObject);
    procedure SpeedButtonApplyUpdatesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

uses dmDataAccess;

procedure TForm2.SpeedButtonApplyUpdatesClick(Sender: TObject);
begin
  DataModule1.ApplyCustomers;
end;

procedure TForm2.SpeedButtonRefreshClick(Sender: TObject);
begin
  DataModule1.GetCustomers;
  Grid1.Columns[0].Width := 100;
  Grid1.Columns[1].Width := 200;
end;

end.
