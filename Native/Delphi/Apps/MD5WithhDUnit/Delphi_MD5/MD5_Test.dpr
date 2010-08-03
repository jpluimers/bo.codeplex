Program MD5_Test;
{$APPTYPE CONSOLE}
Uses
	Windows, SysUtils,
	MD5;

Procedure Test (Const CorrectResult: String; Const Value: String);
var
	s: string;
begin
	s:= StringMD5Digest(Value);
	Write('MD5(', Value, ') -> ', s);
	if UpperCase(s)<>UpperCase(CorrectResult) then
		Write(' ! fail, must be ', CorrectResult)
	else
		Write(' o.k.');
	WriteLn
end;

procedure TestAll;
begin
	Test('d41d8cd98f00b204e9800998ecf8427e', '');
	Test('0cc175b9c0f1b6a831c399e269772661', 'a');
	Test('900150983cd24fb0d6963f7d28e17f72', 'abc');
	Test('f96b697d7cb7938d525a2f31aaf161d0', 'message digest');
	Test('c3fcd3d76192e4007dfb496cca67e13b', 'abcdefghijklmnopqrstuvwxyz');
	Test('d174ab98d277d9f5a5611c2c9f419d9f', 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789');
	Test('57edf4a22be3c955ac49da2e2107b67a', '12345678901234567890123456789012345678901234567890123456789012345678901234567890');
end;

Begin
	TestAll;

End.
