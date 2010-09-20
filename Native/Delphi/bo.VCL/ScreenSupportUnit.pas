unit ScreenSupportUnit;

interface

uses
  SysUtils;

type
  TScreenSupport = class(TObject)
  public
    class procedure ExecuteWithWaitCursor(const Proc: TProc); overload; static;
  end;

implementation

uses
  Forms, Controls;

class procedure TScreenSupport.ExecuteWithWaitCursor(const Proc: TProc);
var
  OldCursor: TCursor;
begin
  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;
    Proc();
  finally
    Screen.Cursor := OldCursor;
  end;
end;

end.
