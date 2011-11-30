rem creates directory %temp%\list
rem then in %temp%\list creates/removes directories 0..9, each time waiting that many seconds
rem finally removes directory %temp%\list
rem progress is easy to monitor with Process Explorer / Process Monitor from SysInternals
rem or the Windows explorer
  if "%1"=="" goto :list
:item
  mkdir %temp%\list\%1
  rem wait N seconds
  ping -n %1 localhost
  rmdir %temp%\list\%1
  goto :end
:list
  mkdir %temp%\list
  for %%n in (0 1 2 3 4 5 6 7 8 9) do call %0 %%n
  rmdir %temp%\list
:end
