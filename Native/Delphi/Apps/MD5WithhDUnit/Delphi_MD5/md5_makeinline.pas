Program MD5_ml;
// Generates Inline for MD5 speed up
// (c) 29.4.2000 Peter Sawatzki <Peter@Sawatzki.de>
//
{$APPTYPE CONSOLE}
Uses
  SysUtils;
Var
  TF: TextFile;
Const
  CR = #13#10;
  PreLude =
    'Procedure Transform (Var Accu; Const Buf);'+CR
   +'Asm '+CR
   +'Push EBx;'+CR
   +'Push ESi;'+CR
   +'Push EDi;'+CR
   +'Push EBp'+CR
   +'Mov EBp,EDx {Buf -> EBp};'+CR
   +'Push EAx {Accu->Stack};'+CR
   +'Mov EDx,[EAx+12];'+CR
   +'Mov ECx,[EAx+8];'+CR
   +'Mov EBx,[EAx+4];'+CR
   +'Mov EAx,[EAx]';
  PostLude =
    'Pop ESi{get Accu};'+CR
   +'Add [ESi],EAx;'+CR
   +'Add [ESi+4],EBx;'+CR
   +'Add [ESi+8],ECx;'+CR
   +'Add [ESi+12],EDx;'+CR
   +'Pop EBp;'+CR
   +'Pop EDi;'+CR
   +'Pop ESi;'+CR
   +'Pop EBx'+CR
   +'End;';
  FFInstructions =
   'Add %a,%l;'
  +'Add %a,%k;'
  +'Mov %r1,%b;'
  +'Not %r1;'
  +'And %r1,%d;'
  +'Mov %r2,%c;'
  +'And %r2,%b;'
  +'Or %r1,%r2;'
  +'Add %a,%r1;'
  +'Rol %a,%s;'
  +'Add %a,%b';

  GGInstructions =
   'Add %a,%l;'
  +'Add %a,%k;'
  +'Mov %r1,%d;'
  +'Not %r1;'
  +'And %r1,%c;'
  +'Mov %r2,%d;'
  +'And %r2,%b;'
  +'Or %r1,%r2;'
  +'Add %a,%r1;'
  +'Rol %a,%s;'
  +'Add %a,%b';

  HHInstructions =
   'Add %a,%l;'
  +'Add %a,%k;'
  +'Mov %r1,%d;'
  +'Xor %r1,%c;'
  +'Xor %r1,%b;'
  +'Add %a,%r1;'
  +'Rol %a,%s;'
  +'Add %a,%b';

  IIInstructions =
   'Add %a,%l;'
  +'Add %a,%k;'
  +'Mov %r1,%d;'
  +'Not %r1;'
  +'Or %r1,%b;'
  +'Xor %r1,%c;'
  +'Add %a,%r1;'
  +'Rol %a,%s;'
  +'Add %a,%b';

  Procedure Repl (Instr, a, b, c, d, l: String; s, k: LongWord);
  Var
    St: String;
  Begin
    St:= Instr;
    St:= StringReplace(St, '%a', a, [rfReplaceAll]);
    St:= StringReplace(St, '%b', b, [rfReplaceAll]);
    St:= StringReplace(St, '%c', c, [rfReplaceAll]);
    St:= StringReplace(St, '%d', d, [rfReplaceAll]);
    St:= StringReplace(St, '%l', l, [rfReplaceAll]);
    St:= StringReplace(St, '%s', IntToStr(s), [rfReplaceAll]);
    St:= StringReplace(St, '%k', Format('$%x', [k]), [rfReplaceAll]);
    St:= StringReplace(St, '%r1', 'ESi', [rfReplaceAll]);
    St:= StringReplace(St, '%r2', 'EDi', [rfReplaceAll]);
    WriteLn(TF, St);
  End;

  Procedure FF (a, b, c, d, l: String; s, k: LongWord);
  Begin
    Repl(FFInstructions, a, b, c, d, l, s, k)
  End;

  Procedure GG (a, b, c, d, l: String; s, k: LongWord);
  Begin
    Repl(GGInstructions, a, b, c, d, l, s, k)
  End;

  Procedure HH (a, b, c, d, l: String; s, k: LongWord);
  Begin
    Repl(HHInstructions, a, b, c, d, l, s, k)
  End;

  Procedure II (a, b, c, d, l: String; s, k: LongWord);
  Begin
    Repl(IIInstructions, a, b, c, d, l, s, k)
  End;

Var
  a,b,c,d: String;
  lBuf: Array[0..15] Of String;
  i: Integer;
Begin
  AssignFile(TF, 'MD5Inl.inc');
  Rewrite(TF);

  WriteLn(TF, PreLude);

  a:= 'EAx';
  b:= 'EBx';
  c:= 'ECx';
  d:= 'EDx';
  For i:= 0 To 15 Do
    lBuf[i]:= Format('[EBp+%d]', [i*4]);

  FF(a,b,c,d, lBuf[ 0],  7, $d76aa478); { 1 }
  FF(d,a,b,c, lBuf[ 1], 12, $e8c7b756); { 2 }
  FF(c,d,a,b, lBuf[ 2], 17, $242070db); { 3 }
  FF(b,c,d,a, lBuf[ 3], 22, $c1bdceee); { 4 }
  FF(a,b,c,d, lBuf[ 4],  7, $f57c0faf); { 5 }
  FF(d,a,b,c, lBuf[ 5], 12, $4787c62a); { 6 }
  FF(c,d,a,b, lBuf[ 6], 17, $a8304613); { 7 }
  FF(b,c,d,a, lBuf[ 7], 22, $fd469501); { 8 }
  FF(a,b,c,d, lBuf[ 8],  7, $698098d8); { 9 }
  FF(d,a,b,c, lBuf[ 9], 12, $8b44f7af); { 10 }
  FF(c,d,a,b, lBuf[10], 17, $ffff5bb1); { 11 }
  FF(b,c,d,a, lBuf[11], 22, $895cd7be); { 12 }
  FF(a,b,c,d, lBuf[12],  7, $6b901122); { 13 }
  FF(d,a,b,c, lBuf[13], 12, $fd987193); { 14 }
  FF(c,d,a,b, lBuf[14], 17, $a679438e); { 15 }
  FF(b,c,d,a, lBuf[15], 22, $49b40821); { 16 }

  GG(a,b,c,d, lBuf[ 1],  5, $f61e2562); { 17 }
  GG(d,a,b,c, lBuf[ 6],  9, $c040b340); { 18 }
  GG(c,d,a,b, lBuf[11], 14, $265e5a51); { 19 }
  GG(b,c,d,a, lBuf[ 0], 20, $e9b6c7aa); { 20 }
  GG(a,b,c,d, lBuf[ 5],  5, $d62f105d); { 21 }
  GG(d,a,b,c, lBuf[10],  9, $02441453); { 22 }
  GG(c,d,a,b, lBuf[15], 14, $d8a1e681); { 23 }
  GG(b,c,d,a, lBuf[ 4], 20, $e7d3fbc8); { 24 }
  GG(a,b,c,d, lBuf[ 9],  5, $21e1cde6); { 25 }
  GG(d,a,b,c, lBuf[14],  9, $c33707d6); { 26 }
  GG(c,d,a,b, lBuf[ 3], 14, $f4d50d87); { 27 }
  GG(b,c,d,a, lBuf[ 8], 20, $455a14ed); { 28 }
  GG(a,b,c,d, lBuf[13],  5, $a9e3e905); { 29 }
  GG(d,a,b,c, lBuf[ 2],  9, $fcefa3f8); { 30 }
  GG(c,d,a,b, lBuf[ 7], 14, $676f02d9); { 31 }
  GG(b,c,d,a, lBuf[12], 20, $8d2a4c8a); { 32 }

  HH(a,b,c,d, lBuf[ 5],  4, $fffa3942); { 33 }
  HH(d,a,b,c, lBuf[ 8], 11, $8771f681); { 34 }
  HH(c,d,a,b, lBuf[11], 16, $6d9d6122); { 35 }
  HH(b,c,d,a, lBuf[14], 23, $fde5380c); { 36 }
  HH(a,b,c,d, lBuf[ 1],  4, $a4beea44); { 37 }
  HH(d,a,b,c, lBuf[ 4], 11, $4bdecfa9); { 38 }
  HH(c,d,a,b, lBuf[ 7], 16, $f6bb4b60); { 39 }
  HH(b,c,d,a, lBuf[10], 23, $bebfbc70); { 40 }
  HH(a,b,c,d, lBuf[13],  4, $289b7ec6); { 41 }
  HH(d,a,b,c, lBuf[ 0], 11, $eaa127fa); { 42 }
  HH(c,d,a,b, lBuf[ 3], 16, $d4ef3085); { 43 }
  HH(b,c,d,a, lBuf[ 6], 23, $04881d05); { 44 }
  HH(a,b,c,d, lBuf[ 9],  4, $d9d4d039); { 45 }
  HH(d,a,b,c, lBuf[12], 11, $e6db99e5); { 46 }
  HH(c,d,a,b, lBuf[15], 16, $1fa27cf8); { 47 }
  HH(b,c,d,a, lBuf[ 2], 23, $c4ac5665); { 48 }

  II(a,b,c,d, lBuf[ 0],  6, $f4292244); { 49 }
  II(d,a,b,c, lBuf[ 7], 10, $432aff97); { 50 }
  II(c,d,a,b, lBuf[14], 15, $ab9423a7); { 51 }
  II(b,c,d,a, lBuf[ 5], 21, $fc93a039); { 52 }
  II(a,b,c,d, lBuf[12],  6, $655b59c3); { 53 }
  II(d,a,b,c, lBuf[ 3], 10, $8f0ccc92); { 54 }
  II(c,d,a,b, lBuf[10], 15, $ffeff47d); { 55 }
  II(b,c,d,a, lBuf[ 1], 21, $85845dd1); { 56 }
  II(a,b,c,d, lBuf[ 8],  6, $6fa87e4f); { 57 }
  II(d,a,b,c, lBuf[15], 10, $fe2ce6e0); { 58 }
  II(c,d,a,b, lBuf[ 6], 15, $a3014314); { 59 }
  II(b,c,d,a, lBuf[13], 21, $4e0811a1); { 60 }
  II(a,b,c,d, lBuf[ 4],  6, $f7537e82); { 61 }
  II(d,a,b,c, lBuf[11], 10, $bd3af235); { 62 }
  II(c,d,a,b, lBuf[ 2], 15, $2ad7d2bb); { 63 }
  II(b,c,d,a, lBuf[ 9], 21, $eb86d391); { 64 }

  WriteLn(TF, PostLude);
  CloseFile(TF);
End.
