Program MD5_File;
{$APPTYPE CONSOLE}
Uses
  MD5;
Begin
  If ParamStr(1)='' Then
    WriteLn('Usage: ',ParamStr(0),' FileName')
  Else
    WriteLn('MD5=', FileMD5Digest(ParamStr(1)))
End.
