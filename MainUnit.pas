unit MainUnit;

interface

uses
  Forms,
  StdCtrls, Spin;

type
  TMainForm = class(TForm)
    GenBtn: TButton;
    PassEd: TEdit;
    PLen: TSpinEdit;
    Label1: TLabel;
    MinU: TSpinEdit;
    MinL: TSpinEdit;
    MinN: TSpinEdit;
    MinS: TSpinEdit;
    SymbCh: TComboBox;
    Label6: TLabel;
    ExcCh: TComboBox;
    Label7: TLabel;
    AutoCpyChB: TCheckBox;
    VisibChB: TCheckBox;
    Button1: TButton;
    UUc: TCheckBox;
    ULc: TCheckBox;
    UNc: TCheckBox;
    USc: TCheckBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    procedure GenBtnClick(Sender: TObject);
    procedure VisibChBClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}
uses
  Clipbrd, StrUtils;

procedure TMainForm.GenBtnClick(Sender: TObject);
//const
//  cLower   = 'abcdefghijklmnopqrstuvwxyz';
//  cUpper   = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
//  cNumbers = '0123456789';
//  cExtra   = '!#$%&*+-=?@^_';
(*
const upperCase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
//const lowerCase = upperCase.toLowerCase();
const numbers = '1234567890';
const specialCharacters = '!#$%&*+-=?@^_';
const ambiguousCharacters = '{}[]()/\\''"`~,;:.<>';
const similarCharacters = 'il1Lo0O';
*)
var
  minLower, minUpper, minExtr, minNum: Integer;
  cLower, cUpper, cNumbers: string;
  result: string;
  rmap: string;
  cExtra: string;
  cExclude: string;
  passLength: Integer;
  fc: Integer; // Filled Count
  uu, ul, un, us: Boolean;

  function ExChars(const Ex, S: string): string;
  var
    p, i: Integer;
  begin
    // remove exclude chars
    result := S;
    for i := 1 to Length(Ex) do
      repeat
        p := Pos(Ex[i], result);
        if p < 1 then
          Break;
        Delete(result, p, 1);
      until false;
  end;

  function RemDup(const S: string): string;
  var
    i, p: Integer;
  begin
    // remove duplicate chars
    result := S;
    i := 1;
    repeat
      if i >= Length(result) then
        Break;
      repeat
        p := PosEx(result[i], result, i + 1);
        if p > 0 then
          Delete(result, p, 1)
        else
          Break;
      until false;
      Inc(i);
    until false;
  end;

  function EmPos: Integer;
  begin
    // find random empty position
    repeat
      result := Random(Length(rmap)) + 1;
    until rmap[result] = #32;
    rmap[result] := 'F';
  end;

  procedure fillWith(const b: Boolean; const S1: string; const min: Integer = 1);
  var
    i, p: Integer;
  begin
    if not b then
      exit;
    for i := 1 to min do
      if fc < passLength then
      begin
        p := EmPos;
        result[p] := S1[Random(Length(S1)) + 1];
        Inc(fc);
      end;

  end;

  function GetTotal: Integer;
  begin
    result := 0;
    if uu then
      Inc(result, Length(cUpper));
    if ul then
      Inc(result, Length(cLower));
    if un then
      Inc(result, Length(cNumbers));
    if us then
      Inc(result, Length(cExtra));
  end;

begin
  //
  minLower := MinL.Value;
  minUpper := MinU.Value;
  minExtr := MinS.Value;
  minNum := MinN.Value;
  passLength := PLen.Value;
  uu := UUc.Checked;
  ul := ULc.Checked;
  un := UNc.Checked;
  us := USc.Checked;

  if (passLength < 1) then
    exit;
  cExclude := RemDup(ExcCh.Text);
  cExtra := ExChars(cExclude, SymbCh.Text);
  cLower := ExChars(cExclude, 'abcdefghijklmnopqrstuvwxyz');
  cUpper := ExChars(cExclude, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ');
  cNumbers := ExChars(cExclude, '0123456789');
  if GetTotal = 0 then
  begin
    //ShowMessage('There is no raw material for creating a password.');
    exit;
  end;
  result := stringofchar(' ', passLength);
  rmap := stringofchar(' ', passLength);
  fc := 0;
  //RandSeed
  Randomize;
  fillWith(ul, cLower, minLower);
  fillWith(uu, cUpper, minUpper);
  fillWith(un, cNumbers, minNum);
  fillWith(us, cExtra, minExtr);
  while fc < passLength do
    case Random(4) of
      0: fillWith(ul, cLower);
      1: fillWith(uu, cUpper);
      2: fillWith(un, cNumbers);
      3: fillWith(us, cExtra);
    end;
  PassEd.Text := result;
  if AutoCpyChB.Checked then
    Clipboard.AsText := result;
end;

procedure TMainForm.VisibChBClick(Sender: TObject);
begin
  case VisibChB.Checked of
    true:
      PassEd.PasswordChar := #0;
    false:
      PassEd.PasswordChar := '*';
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  VisibChBClick(nil);
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  Clipboard.AsText := PassEd.Text;
end;

end.
