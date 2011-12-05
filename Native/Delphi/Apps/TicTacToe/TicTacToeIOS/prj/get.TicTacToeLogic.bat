@echo off
for /R ..\..\TicTacToeLogic\src %%p in (*.pas) do copy /y %%p %~dp0%%~nxp
copy /y ..\..\..\..\bo.TypeInfo\EnumTypeInfoUnit.pas %~dp0
pause

