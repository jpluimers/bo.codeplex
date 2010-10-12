program NLFMJSON2ASX;

uses
  Forms,
  NLFMJSON2ASXFormUnit in '..\src\NLFMJSON2ASXFormUnit.pas' {NLFMJSON2ASXForm},
  ASXSchemaUnit in '..\src\ASXSchemaUnit.pas',
  ASXUnit in '..\src\ASXUnit.pas',
  NLFMJSON2ASXUnit in '..\src\NLFMJSON2ASXUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TNLFMJSON2ASXForm, NLFMJSON2ASXForm);
  Application.Run;
end.
