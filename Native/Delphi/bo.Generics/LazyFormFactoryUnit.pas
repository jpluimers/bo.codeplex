unit LazyFormFactoryUnit;

interface

uses
  Forms;

type
  // for generic type constraints, see
  // http://stackoverflow.com/questions/2048322/simple-types-with-generics-in-delphi
//  TLazyFormFactory<T: class, constructor> = record
  TLazyFormFactory<T: TForm, constructor> = record
  private
    FInstance: T;
    function GetInstance: T;
  public
    property Instance: T read GetInstance;
  end;

implementation

function TLazyFormFactory<T>.GetInstance: T;
var
  FormClass: TFormClass;
  Form: TForm;
begin
  if not Assigned(FInstance) then
  begin
    FormClass := TFormClass(T);
    Form := FormClass.Create(Application);
    FInstance := T(Form); //##jpl: bug; cannot combine these two statements into one.
  end;
  Result := FInstance;
end;

end.
