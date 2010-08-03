set sqlrun=
call sql-find-sqlcmd.bat
call sql-find-instance.bat
if not !!==!%sqlcmd%! if not !!==!%sqlinstance%! set sqlrun=%sqlcmd% -S %sqlinstance% -E
echo SQLRUN=%sqlrun%


