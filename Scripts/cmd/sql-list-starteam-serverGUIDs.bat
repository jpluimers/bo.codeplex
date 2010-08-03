call sql-set-sqlrun.bat
echo.
%sqlrun% -Q "exec sp_msforeachdb 'use [?]; if object_id(''dbo.s0'') is not null select ''?'' as server, cast(F3 as varchar(36)) as serverGUID from [?].[dbo].s0'"
endlocal

