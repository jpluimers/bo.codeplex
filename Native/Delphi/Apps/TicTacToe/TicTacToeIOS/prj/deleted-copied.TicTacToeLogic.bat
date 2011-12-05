@echo off
for /R ..\..\TicTacToeLogic\src %%p in (*.pas) do del %~dp0%%~nxp
del %~dp0EnumTypeInfoUnit.pas
pause


