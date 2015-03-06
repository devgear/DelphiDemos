unit Vcl.EditExtends;

interface

uses
  Vcl.StdCtrls, Vcl.Controls, System.Classes;

type
  TEdit = class(Vcl.StdCtrls.TEdit)
  private
    function GetPlainText: string;
    procedure SetPlainText(const Value: string);
  protected
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
  public
    property PlainText: string read GetPlainText write SetPlainText;
  end;

implementation

uses
  SysUtils;

{ TEditEx }

procedure TEdit.KeyUp(var Key: Word; Shift: TShiftState);
var
  S: string;
begin

  inherited;

  S := Text;
  S := S.Replace(',', '').Replace('.', '');
  Text := FormatFloat('#.###,##', StrToFloatDef(S, 0));
  selStart := Length(Text) + 1;
end;

function TEdit.GetPlainText: string;
var
  S: string;
begin
  S := Text;
  Result := S.Replace(',', '').Replace('.', '');
end;

procedure TEdit.SetPlainText(const Value: string);
var
  Key: Word;
begin
  Text := Value;
  KeyUp(Key, []);
end;

end.
