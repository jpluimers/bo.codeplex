@echo off
  if !%1!==!! goto :syntax
  goto :begin
:syntax
  echo Syntax: %0 parameters-for-sp_helpdb
  echo Example: %0 master
  goto :end
:begin
call sql-find-sqlcmd.bat
call sql-find-instance.bat
setlocal
set run=%sqlcmd% -S %sqlinstance% -E -h -1 -Q 
set run=%sqlcmd% -S %sqlinstance% -E -Q 
@echo on
%run% "exec sp_helpdb '%*'"
endlocal
:end