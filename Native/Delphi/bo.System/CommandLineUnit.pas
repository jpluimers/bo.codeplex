unit CommandlineUnit;

interface

uses
  Classes;

function CommandLine: string;
function CreateCommandLineStrings: TStrings;

implementation

uses
  Windows;

function CommandLine: string;
begin
  Result := GetCommandLine();
end;

function CreateCommandLineStrings: TStrings;
begin
// TODO ##jpl: make platform independent
  Result := TStringList.Create();
  Result.CommaText := CommandLine; // will split at comma (,) and space ( ).
end;

end.

