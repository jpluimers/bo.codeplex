@echo off
  rem see http://serverfault.com/questions/338/how-do-you-add-an-administrator-user-to-sql-server-2008

  if "%2"=="" goto :syntax

  call sql-set-sqlrun.bat

  set sqluser=%1
  set sqlpassword=%2

  rem CREATE LOGIN loginName { WITH <option_list1> | FROM <sources> }
@echo on

  %sqlcmd% -S %sqlinstance% -E -Q "CREATE LOGIN [%sqluser%] WITH PASSWORD = '%sqlpassword%';"
  %sqlcmd% -S %sqlinstance% -E -Q "GRANT CONTROL SERVER TO [%sqluser%];"
@echo off
  set sqluser=
  set sqlpassword=
  goto :exit

:syntax
  echo Syntax: %0 username password
  goto :exit

:exit