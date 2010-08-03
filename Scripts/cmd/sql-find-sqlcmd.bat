@echo off
rem find the highest version of SQLCMD.EXE or OSQL.EXE and put it in the sqlcmd environment variable
rem this prefers SQLCMD.EXE over OSQL.EXE

set sqlcmd=

for %%d in ("%ProgramFiles%", "%ProgramFiles(x86)%") do for %%v in (80, 90, 100) do for %%f in (OSQL, SQLCMD) do (
call :sqlcmdtest "%%~d\Microsoft SQL Server\%%v\Tools\Binn\%%f.EXE"
)

if !!==!%sqlcmd%! for %%f in (OSQL, SQLCMD) do (
call :find-on-path %%f.EXE
)

echo SQLCMD: %sqlcmd%
goto :exit

rem be carefull not to specify the .EXE in the %%f FOR loop-expression, otherwise it tries to dine SQLCMD.EXE and OQSL.EXE in the current directory

rem http://msdn.microsoft.com/en-us/library/ms178653.aspx
rem 80 = SQL Server 2000
rem 90 = SQL Server 2005
rem 100 = SQL Server 2008 and 2008 R2


:find-on-path
set sqlcmd=%~f$PATH:1
if not ""=="%sqlcmd%" set sqlcmd="%sqlcmd%"
goto :exit

:sqlcmdtest
if exist %1 echo found %1 & set sqlcmd=%1

:exit

