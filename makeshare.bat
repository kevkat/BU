REM=== Syntax is makeshare.bat username
REM=== This will create a Facstaffusers folder with the correct permissions

@echo off
mkdir \\smgshare\Facstaffusers\%1
ICACLS \\smgshare\Facstaffusers\%1 /grant %1:(OI)(CI)(M)
ICACLS \\smgshare\Facstaffusers\%1 /deny %1:(D)
