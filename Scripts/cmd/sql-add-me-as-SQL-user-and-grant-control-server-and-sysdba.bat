@echo off
  rem see http://serverfault.com/questions/338/how-do-you-add-an-administrator-user-to-sql-server-2008

  call sql-set-sqlrun.bat

  set sqluser=sa
  if not "%1"=="" set sqluser=%1

  for /f "usebackq" %%u in (`whoami`) do (
  echo %%u
  rem %%u == Domain\User
  rem -U sa -P password
  rem with only "-U sa" you are prompted for a password
  echo login twice with SQL user "%sqluser%":
  %sqlcmd% -S %sqlinstance% -U %sqluser% -Q "CREATE LOGIN [%%u] FROM WINDOWS;"
  %sqlcmd% -S %sqlinstance% -U %sqluser% -Q "EXEC master..sp_addsrvrolemember @loginame = N'%%u', @rolename = N'sysadmin';"
  %sqlcmd% -S %sqlinstance% -U %sqluser% -Q "GRANT CONTROL SERVER TO [%%u];"
)

  set sqluser=
:exit