unit DivModUnit;

// http://coding.derkeiler.com/Archive/Delphi/borland.public.delphi.language.basm/2005-09/msg00519.html

interface

// LongInt is an alias for Integer
procedure IDivMod(const Dividend, Divisor: LongInt; var Result, Remainder:LongInt);

// LongWord is an alias for Cardinal
procedure UDivMod(const Dividend, Divisor: LongWord; var Result, Remainder:LongWord);

procedure I64DivMod(const Dividend, Divisor: Int64; var Result, Remainder:Int64);

//1 Result is Dividend by Divisor; Remainder is what is left;
/// http://www.delphigroups.info/2/5/802912.html
/// http://www.delphigroups.info/2/8/804091.html
procedure I64LWDivMod(const Dividend: Int64; const Divisor: LongWord; var Result, Remainder: Int64);

implementation

//******************************************************************************
// Procedure Name: IDivMod
// Input parameters: Dividend: Number to be divided
// Divisor: Number to be divided BY
// Output params: Result: = (Dividend div Divisor)
// Remainder: = (Dividend mod Divisor)
// Dependencies: ..
// Description: All-32-bit SIGNED INT version of DivMod from SysUtils.pas.
// This routine can save quite some time when you want to have
// both DIV and MOD results of a pair (Dividend,Divisor).
// Notes: Courtesy of Robert Rossmair
//******************************************************************************
procedure IDivMod(const Dividend, Divisor: LongInt; var Result, Remainder:LongInt);
asm
  push ebx
  mov ebx, edx
  cdq
  idiv ebx
  mov ebx, Remainder
  mov [ecx],eax
  mov [ebx],edx
  pop ebx
end; // proc IDivMod

//******************************************************************************
// Procedure Name: UDivMod
// Input parameters: Dividend: Number to be divided
// Divisor: Number to be divided BY
// Output params: Result: = (Dividend div Divisor)
// Remainder: = (Dividend mod Divisor)
// Dependencies: ..
// Description: All-32-bit UNSIGNED version of DivMod from SysUtils.pas.
// This routine can save quite some time when you want to have
// both DIV and MOD results of a pair (Dividend,Divisor).
// Notes: Courtesy of Robert Rossmair
//******************************************************************************
procedure UDivMod(const Dividend, Divisor: LongWord; var Result, Remainder:LongWord);
asm
  push ebx
  mov ebx,edx
  xor edx,edx
  div ebx
  mov ebx,Remainder
  mov [ecx],eax
  mov [ebx],edx
  pop ebx
end; // proc UDivMod

//******************************************************************************
// Procedure Name: IDivMod64
// Input parameters: Dividend: Number to be divided
// Divisor: Number to be divided BY
// Output params: Result: = (Dividend div Divisor)
// Remainder: = (Dividend mod Divisor)
// Dependencies: ..
// Description: All-64-bit SIGNED Int64 version of DivMod from SysUtils.pas.
// This routine can save quite some time when you want to have
// both DIV and MOD results of a pair (Dividend,Divisor).
// Notes: Contribution from Asbjoern "Lord CRC", in Borland Newsgroup
// forum borland.public.delphi.language.basm (27/07/2005)
// This ASM code, though quite "big", is more than twice as
// fast as the "Naive" (pascal) IDivMod64 (see unit test).
//******************************************************************************
procedure I64DivMod(const Dividend, Divisor: Int64; var Result, Remainder:Int64);
asm
  push ebx
  push edi
  push esi

  mov esi, eax // esi = Result
  mov edi, edx // edi = Remainder

  mov ecx, [ebp+$08] // Divisor
  mov ebx, [ebp+$0C] // Divisor

  mov eax, [ebp+$10] // Dividend
  mov edx, [ebp+$14] // Dividend

  mov ebp, 0

  or ebx, ebx
  jns @@noneg1
  // force positive Divisor
  neg ecx
  adc ebx, 0
  neg ebx
  mov ebp, 1

@@noneg1:
  or edx, edx
  jns @@noneg2
  // force positive Dividend
  neg eax
  adc edx, 0
  neg edx
  or ebp, 2

@@noneg2:
  push ebp // store sign flags

  // if both highwords are zero, use regular division
  or ebx, ebx
  jnz @@binary

  or ecx, ecx // let div raise division by zero
  jz @@regular

  or edx, edx
  jz @@regular

@@binary:
  push edi
  push esi

  mov ebp, 64

  xor esi, esi
  xor edi, edi

@@loop:
  shl eax, 1
  rcl edx, 1
  rcl esi, 1
  rcl edi, 1

  cmp edi, ebx // check high words
  jb @@nosub
  ja @@sub
  cmp esi, ecx // check low words
  jb @@nosub

@@sub:
  sub esi, ecx // subtract divisor
  sbb edi, ebx
  inc eax // increment result

@@nosub:
  dec ebp
  jnz @@loop

  pop ecx
  pop ebx

  jmp @@exit

@@regular:
  div ecx
  mov ecx, esi
  mov ebx, edi

  mov esi, edx
  xor edi, edi
  xor edx, edx

@@exit:
  pop ebp
  or ebp, ebp
  jp @@signmod
  // one of the parameters was negative
  // so negate result
  neg edx
  neg eax
  sbb edx,0

@@signmod:
  test ebp, 2 // is dividend negative?
  jz @@store
  // it was, so negate remainder
  neg edi
  neg esi
  sbb edi,0

@@store:
  mov [ebx], esi
  mov [ebx+4], edi
  mov [ecx], eax
  mov [ecx+4], edx

  pop esi
  pop edi
  pop ebx
end; // proc IDivMod64

procedure I64LWDivMod(const Dividend: Int64; const Divisor: LongWord; var Result, Remainder: Int64);
asm
  push ebx
  push edi
  push esi

  mov esi, edx // esi = Result
  mov edi, ecx // edi = Remainder

  mov ecx, eax // Divisor

  mov eax, [ebp+$08] // Dividend
  mov edx, [ebp+$0C] // Dividend

  mov ebp, 0

//  or ebx, ebx
//  jns @@noneg1
//  // force positive Divisor
//  neg ecx
//  adc ebx, 0
//  neg ebx
//  mov ebp, 1

@@noneg1:
  or edx, edx
  jns @@noneg2
  // force positive Dividend
  neg eax
  adc edx, 0
  neg edx
  or ebp, 2

@@noneg2:
  push ebp // store sign flags

//  // if both highwords are zero, use regular division
//  or ebx, ebx
//  jnz @@binary

  or ecx, ecx // let div raise division by zero
  jz @@regular

  or edx, edx
  jz @@regular

@@binary:
  push edi
  push esi

  mov ebp, 64

  xor esi, esi
  xor edi, edi

@@loop:
  shl eax, 1
  rcl edx, 1
  rcl esi, 1
  rcl edi, 1

  cmp edi, 0 // check high words
  jb @@nosub
  ja @@sub
  cmp esi, ecx // check low words
  jb @@nosub

@@sub:
  sub esi, ecx // subtract divisor
  sbb edi, 0
  inc eax // increment result

@@nosub:
  dec ebp
  jnz @@loop

  pop ecx
  pop ebx

  jmp @@exit

@@regular:
  div ecx
  mov ecx, esi
  mov ebx, edi

  mov esi, edx
  xor edi, edi
  xor edx, edx

@@exit:
  pop ebp
  or ebp, ebp
  jp @@signmod
  // one of the parameters was negative
  // so negate result
  neg edx
  neg eax
  sbb edx,0

@@signmod:
  test ebp, 2 // is dividend negative?
  jz @@store
  // it was, so negate remainder
  neg edi
  neg esi
  sbb edi,0

@@store:
  mov [ebx], esi
  mov [ebx+4], edi
  mov [ecx], eax
  mov [ecx+4], edx

  pop esi
  pop edi
  pop ebx
end; // procedure I64LWDivMod

//procedure I64LWDivMod(const Dividend: Int64; const Divisor: LongWord; var Result, Remainder: Int64);
//asm
//  push ebx
//  push edi
//  push esi
//
//  mov esi, edx // esi = Result
//  mov edi, ecx // edi = Remainder
//
//  mov ecx, eax // Divisor
//  or ecx, ecx
//  jz @@regular // use regular to force division by zero
//  mov eax, [ebp+$08]
//  mov edx, [ebp+$0C]
//  or edx, edx
//  jns @@noneg
//  // force positive Dividend
//  neg eax
//  adc edx, 0
//  neg edx
//@@noneg:
//  // if highword is zero, use regular division
//  cmp edx, 0
//  je @@regular
//  push edi
//  push esi
//  mov ebp, 64
//  xor esi, esi
//  xor edi, edi
//@@loop:
//  shl eax, 1
//  rcl edx, 1
//  rcl esi, 1
//  rcl edi, 1
//  cmp edi, 0 // check high words
//  jb @@nosub
//  ja @@sub
//  cmp esi, ecx // check low words
//  jb @@nosub
//@@sub:
//  sub esi, ecx // subtract divisor
//  sbb edi, 0
//  inc eax // increment result
//@@nosub:
//  dec ebp
//  jnz @@loop
//  pop ecx
//  pop ebx
//  mov [ebx], esi
//  mov [ebx+4], edi
//  mov [ecx], eax
//  mov [ecx+4], edx
//  jmp @@exit
//@@regular:
//  div ecx
//  mov [esi], eax
//  mov [esi+4], 0
//  mov [edi], edx
//  mov [edi+4], 0
//@@exit:
//  pop esi
//  pop edi
//  pop ebx
//end;

end.
