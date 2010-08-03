call sql-find-instance.bat
@echo on
net stop %sqlservice%
net start %sqlservice%
