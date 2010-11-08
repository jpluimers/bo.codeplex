unit PhoneRegExFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TPhoneRegExForm = class(TForm)
    PhoneNumberLabeledEdit: TLabeledEdit;
    TestPhoneNumberButton: TButton;
    ResultMemo: TMemo;
    procedure TestPhoneNumberButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PhoneRegExForm: TPhoneRegExForm;

implementation

uses
  RegularExpressions;

const
  SPhoneNumberRegularExpression = '^(\(?\+?[0-9]*\)?)?[0-9_\- \(\)]*$';

{$R *.dfm}

procedure TPhoneRegExForm.TestPhoneNumberButtonClick(Sender: TObject);
var
  Result: string;
begin
  if TRegEx.IsMatch(PhoneNumberLabeledEdit.Text, SPhoneNumberRegularExpression) then
    Result := 'OK'
  else
    Result := 'Bad';
  ResultMemo.Lines.Add(Format('"%s" is %s', [
    PhoneNumberLabeledEdit.Text, Result]));
end;

end.
