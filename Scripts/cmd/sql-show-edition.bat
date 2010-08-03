@echo off
call sql-set-sqlrun.bat
rem %sqlcmd% -S %sqlinstance% -E -h -1 -Q "Select Serverproperty ('edition') SQLServerEdition"
rem version: 
rem 10.00.123456
rem 123456789012345
@echo on
%sqlcmd% -S %sqlinstance% -E -Q "select cast(serverproperty('MachineName') as varchar(20)) MachineName, cast(serverproperty('InstanceName') as varchar(15)) Instance, cast(serverproperty('ProductVersion') as varchar(12)) ProductVersion, cast(serverproperty('ProductLevel') as varchar(5)) ProductLevel, cast(serverproperty('Edition') as varchar(20)) Edition, cast(serverproperty('BuildClrVersion') as varchar(15)) CLR, cast(serverproperty('LicenseType') as varchar(15)) LicenseType, cast(serverproperty('NumLicenses') as varchar(5)) NumLicenses"
