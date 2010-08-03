call sql-set-sqlrun.bat
echo.
%sqlrun% -Q "execute sp_helpuser"
%sqlrun% -Q "execute sp_helplogins"
