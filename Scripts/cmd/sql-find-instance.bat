@echo off
rem find best matching instance of SQL Server on this machine
set sqlinstance=
set sqlservice=
for /f "usebackq tokens=1,2,3 delims=:$" %%i in (`sc query`) do (
rem %%j is " MSSQL" because we dropped space as a delimiter
if "%%i"=="SERVICE_NAME" call :bare-service %%j %%k
)
echo SQL Instance=%sqlinstance%
echo SQL Service=%sqlservice%
goto :exit

:bare-service
rem %1 equals "MSSQL" because of the command-line parsing trims spaces
rem the order is important: we favour named instances over unnamed:
if "%1"=="MSSQLSERVER" call :process-instance %1 .
if "%1"=="MSSQL" call :process-instance MSSQL$%2 .\%2
goto :exit

:process-instance
echo found service "%1" providing instance "%2"
if "%sqlinstance%"=="" set sqlinstance=%2& set sqlservice=%1
for /f "usebackq tokens=1,2,3,4" %%s in (`sc query %1`) do (
if "%%s"=="STATE" echo state of %1 is %%v
)
goto :exit



:exit

