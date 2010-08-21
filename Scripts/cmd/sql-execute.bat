@echo off
  if !%1!==!! goto :syntax
  goto :main
:syntax
  echo Syntax: %0 SQL-statement
  goto :end
:main
  call sql-set-sqlrun.bat
  setlocal
@echo on
  %sqlrun% -Q "%*;"
@echo off
:endlocal
  endlocal
:end