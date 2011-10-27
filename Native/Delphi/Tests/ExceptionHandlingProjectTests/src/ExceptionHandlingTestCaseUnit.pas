unit ExceptionHandlingTestCaseUnit;

interface

uses
  TestFramework;

type
  TExceptionHandlingTestCase = class(TTestCase)

  strict protected
    procedure MyMethodWithBadInput; virtual;
  published
    procedure MyMethod_BadInput_Throws;
    procedure MyMethod_BadInput_Throws1;
  end;

implementation

procedure TExceptionHandlingTestCase.MyMethodWithBadInput;
begin
    sut.MyMethod('this is bad');
end;

procedure TExceptionHandlingTestCase.MyMethod_BadInput_Throws;
begin
    CheckException(MyMethodWithBadInput, MyExpectedException);
end;

// this would be nice
procedure TExceptionHandlingTestCase.MyMethod_BadInput_Throws1;
begin
//    CheckException(
//        BindArguments(sut.MyMethod, 'this is bad'),  // <-- how to do this
//        MyExpectedException);
end;

end.
