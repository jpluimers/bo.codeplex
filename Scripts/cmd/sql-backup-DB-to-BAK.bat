@echo off
  if !%2!==!! goto :syntax
  goto :main
:syntax
  echo Syntax: %0 databasename BAKfilename [noexplorer]
  echo Specifying noexplorer as 3rd parameter won't start the explorer to show the BAKfilename
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
  if "%3"=="noexplorer" goto :endlocal
  explorer /select,%bakfilename%
:endlocal
  endlocal
:end

