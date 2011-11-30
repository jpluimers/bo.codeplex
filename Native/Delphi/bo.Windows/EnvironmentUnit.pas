unit EnvironmentUnit;

interface

uses
  Classes;

procedure LoadEnvironmentStrings(Strings: TStrings); overload;

function LoadEnvironmentStrings: string; overload;

implementation

uses
  Windows,
  SysUtils;

procedure LoadEnvironmentStrings(Strings: TStrings);
var
  AllStrings, CurrentString: PChar;
begin
  AllStrings := GetEnvironmentStrings();
  try
    if AllStrings <> nil then
    begin
      CurrentString := AllStrings;
      while True do
      begin
        Strings.Add(StrPas(CurrentString));
        Inc(CurrentString, Succ(StrLen(CurrentString)));
        if CurrentString[0] = #0 then
          Break;
      end;
    end;
  finally
    FreeEnvironmentStrings(AllStrings);
  end;
end;

function LoadEnvironmentStrings: string;
var
  EnvironmentStrings: TStrings;
begin
  EnvironmentStrings := TStringList.Create();
  try
    LoadEnvironmentStrings(EnvironmentStrings);
    Result := EnvironmentStrings.Text;
  finally
    EnvironmentStrings.Free();
  end;
end;

end.
