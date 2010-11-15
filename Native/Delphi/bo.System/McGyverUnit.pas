unit McGyverUnit;

interface

procedure Touch(var Argument); inline;

implementation

procedure Touch(var Argument);
begin
  // trick from Danny Thorpe: call this towards the end of a unit to fool the optimizer not to get rid of local variables or parameters
end;

end.
