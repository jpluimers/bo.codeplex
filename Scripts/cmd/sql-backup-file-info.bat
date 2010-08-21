@echo off
  if !%1!==!! goto :syntax
  goto :main
:syntax
  echo Syntax: %0 BAKfilename
  goto :end
:main
  call sql-set-sqlrun.bat
  setlocal
  set bakfilename=%1

  set bakdirectory=%~dp1

  rem http://msdn.microsoft.com/en-us/library/ms173778.aspx
rem  %sqlrun% -Q "RESTORE FILELISTONLY FROM DISK = N'%bakfilename%';"
@echo on
  %sqlcmd% -Q "RESTORE FILELISTONLY FROM DISK = N'%bakfilename%';"
@echo off

:endlocal
  endlocal
:end
