@echo off
  echo ScopePrefix
  call :outer 0
  echo ScopePrefix;UnitName;FileName;ParentDirectory
  call :outer 1
goto :end

:outer
:: recursively walk the directory for .pas file having a unit scope
:: http://osix.net/modules/article/?id=755
::  for /F "tokens=*" %%f in ('dir /s /b "C:\Program Files (x86)\Embarcadero\RAD Studio\9.0\source\*.*.pas"') do call :inner %1%%f
for /F "tokens=*" %%f in ('dir /s /b "C:\Program Files (x86)\Embarcadero\RAD Studio\9.0\source\*.pas"') do call :inner %1%%f
goto :end

:inner
setlocal
::http://stackoverflow.com/questions/636381/what-is-the-best-way-to-do-a-substring-in-a-batch-file
  set Parameter=%*
  :: strip the first character: copy from 1 till the end
  set FullFileName=%Parameter:~1%
  set Mode=%Parameter:~0,1%
  shift
::  ~dp does not work for regular environment variables
::  ~dp only works for batch file parameters and loop indexes
  for %%d in ("%FullFileName%") do set ParentDirectory=%%~dpd
  for %%f in ("%FullFileName%") do set FileName=%%~nf
  for %%f in ("%FileName%") do set ScopePrefix=%%~nf
  for %%f in ("%FileName%") do set UnitName=%%~xf
  :: strip the first character: copy from 1 till the end
  if !%UnitName%!==!! goto :noscope
  goto :scope
:noscope
  set UnitName=%ScopePrefix%
  set ScopePrefix=
  goto :display
:scope
  set UnitName=%UnitName:~1%
:display
  if !%Mode%!==!0! if not !%ScopePrefix%!==!! echo %ScopePrefix%
  if !%Mode%!==!1! echo %ScopePrefix%;%UnitName%;%FileName%.pas;%ParentDirectory%
endlocal
  goto :end

:end
