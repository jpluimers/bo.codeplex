@echo off
  if !%2!==!! goto :syntax
  goto :main
:syntax
  echo Syntax: %0 BAKfilename databasename [databasedirectory [noexplorer]]
  echo Specifying noexplorer as 4th parameter won't start the explorer to show the BAKfilename
  goto :end
:main
  call sql-set-sqlrun.bat
  setlocal
  set bakfilename=%1
  set databasename=%2

  set bakdirectory=%~dp1
  rem ##jpl: moeten we eigenlijk parsen met RESTORE FILELISTONLY; dit zijn de defaults zoals SQL Server het normaal doet:
  set dataname=%databasename%
  set logname=%databasename%_log

  rem make sure that the user "NT AUTHORITY\NETWORK SERVICE" has rights in the directory where the .BAK file is:
echo  SubInACL /subdirectories %bakdirectory%\*.* /grant="NETWORK SERVICE"=F

  if !%3!==!! goto :nodirectory

:directory
  set databasedirectory=%3\
  set datafilename=%databasedirectory%%dataname%.mdf
  set logfilename=%databasedirectory%%logname%.ldf

@echo on
  %sqlrun% -Q "RESTORE DATABASE [%databasename%] FROM DISK = N'%bakfilename%' WITH REPLACE, STATS = 10, MOVE N'%dataname%' to N'%datafilename%', MOVE N'%logname%' to N'%logfilename%' ;"
@echo off

  goto :explorer

:nodirectory
@echo on
  %sqlrun% -Q "RESTORE DATABASE [%databasename%] FROM DISK = N'%bakfilename%' WITH REPLACE, STATS = 10;"
@echo off
  goto :endlocal

:explorer
  if "%4"=="noexplorer" goto :endlocal
  explorer /select,%datafilename%

:endlocal
  endlocal
:end