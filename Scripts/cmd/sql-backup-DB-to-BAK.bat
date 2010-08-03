@echo off
  if !%2!==!! goto :syntax
  goto :main
:syntax
  echo Syntax: %0 databasename BAKfilename
  goto :end
:main
  call sql-set-sqlrun.bat
  setlocal
  set bakfilename=%2
  set databasename=%1
@echo on
  %sqlrun% -Q "DBCC SHRINKDATABASE(N'%databasename%')"
  %sqlrun% -Q "BACKUP DATABASE [%databasename%] TO DISK = N'%bakfilename%' WITH STATS = 10;"
@echo off
  explorer /select,%bakfilename%
  endlocal
:end

