@echo off
REM Syntax: inventory.bat hostname
REM Pulls Hostname, OS Name and version, system model, system type, Physical memory, and IIS sites into a text file named hostname.txt
REM The first line will overwrite an existing file, the second line appends, so plan accordingly
REM Required: psexec.exe in the system path, or in C:\Windows\system32

REM Housekeeping: creating the output directory
if not exist C:\invetory mkdir C:\inventory

REM If there's no argument given, run it locally
REM Remote script will run on the host given as an argument
if [%1]==[] goto local 
@echo Running script on %1
@echo Output will be in C:\inventory\%1.txt
@echo 
psexec \\%1 systeminfo | findstr /B /C:"Host Name" /C:"OS Name" /C:"OS Version" /C:"System Model" /C:"System Type" /C:"Processor" /C:"Total Physical Memory" > C:\inventory\%1.txt
psexec \\%1 %windir%\system32\inetsrv\appcmd list site >> C:\inventory\%1.txt
goto :eof

:local
@echo Running script on local host
@echo Output will be in C:\inventory\localhost.txt
@echo 
systeminfo | findstr /B /C:"Host Name" /C:"OS Name" /C:"OS Version" /C:"System Model" /C:"System Type" /C:"Processor" /C:"Total Physical Memory" > C:\inventory\localhost.txt
%windir%\system32\inetsrv\appcmd list site >> C:\inventory\localhost.txt
exit /B 1
