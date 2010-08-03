call sql-set-sqlrun.bat
echo.
echo database; name; filename
setlocal
set run=%sqlrun% -h -1 -Q 
@echo on
@rem %run% "exec sp_msforeachdb 'select ''?'''"
@rem %run% "EXEC sp_MSforeachdb @command1='PRINT ''Listing ?''', @command2='USE ? SELECT DB_NAME()'"
@rem %run% "execute sp_msforeachdb N'use [?] select db_name() execute sp_helpuser'"
%sqlrun% -Q "select cast(name as varchar(30)) as name, status, cast(status as varbinary(8)) as Xstatus, cast(DATABASEPROPERTYEX('master', 'Status') as varchar(20)) AS DBStatus, DATABASEPROPERTY(name, 'issingleuser') as issingleuser, has_dbaccess(name) as has_dbaccess from master.dbo.sysdatabases"
%run% "exec sp_msforeachdb 'select ''?'',name,filename from ?.dbo.sysfiles'"
%sqlrun% -Q "exec sp_msforeachdb 'exec sp_helpdb ''?'''"
endlocal