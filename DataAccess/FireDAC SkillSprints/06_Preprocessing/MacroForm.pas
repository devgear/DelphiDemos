unit MacroForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.StdCtrls, FMX.Grid, FMX.Layouts, FMX.ListBox, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, Fmx.Bind.Grid, Data.Bind.Grid, FMX.TabControl;

type
  TForm4 = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    BindSourceDB2: TBindSourceDB;
    chkMacroQueryActive: TCheckBox;
    Grid2: TGrid;
    Layout1: TLayout;
    Layout2: TLayout;
    Label1: TLabel;
    ListBox1: TListBox;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    ListBox2: TListBox;
    Button1: TButton;
    Grid1: TGrid;
    LinkListControlToField2: TLinkListControlToField;
    LinkGridToDataSourceBindSourceDB22: TLinkGridToDataSource;
    BindSourceDB3: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB3: TLinkGridToDataSource;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure ListBox1Change(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure chkMacroQueryActiveChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure LoadData;
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

uses
  MacroModule;

procedure TForm4.Button1Click(Sender: TObject);
begin
  if ListBox2.Selected = nil then
    raise Exception.Create('필드를 선택해 주세요.');

  LoadData;
end;

procedure TForm4.CheckBox1Change(Sender: TObject);
var
  chk: Boolean;
  I: Integer;
begin
  chk := TCheckBox(Sender).IsChecked;
  for I := 0 to ListBox2.Items.Count - 1 do
    ListBox2.ListItems[I].IsChecked := chk;
end;

procedure TForm4.chkMacroQueryActiveChange(Sender: TObject);
begin
  DM.qryMacroQuery.Active := TCheckBox(Sender).IsChecked;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  TabControl1.TabIndex := 0;
end;

procedure TForm4.ListBox1Change(Sender: TObject);
var
  I: Integer;
begin
  DM.qryFields.Close;
  DM.qryFields.Macros[0].AsRaw := ListBox1.Selected.Text;
  DM.qryFields.Open;
  ListBox2.Items.Clear;
  for I := 0 to DM.qryFields.FieldCount - 1 do
    ListBox2.Items.Add(DM.qryFields.Fields[I].FieldName);
  CheckBox1.IsChecked := False;
end;

procedure TForm4.LoadData;
var
  I: Integer;
  FieldList: string;
  ListBoxitem: TListBoxItem;

  procedure BuildList(Value: string);
  begin
    if FieldList = '' then
      FieldList := Value
    else
      FieldList := FieldList + ', ' + Value;
  end;
begin
  DM.qrySelect.Close;
  for I := 0 to ListBox2.Items.Count - 1 do
    if ListBox2.ListItems[I].IsChecked then
      BuildList(ListBox2.ListItems[I].Text);
  DM.qrySelect.MacroByName('FieldList').AsRaw := FieldList;
  DM.qrySelect.MacroByName('TableName').AsRaw := ListBox1.Selected.Text;
  DM.qrySelect.Open;
end;

end.
