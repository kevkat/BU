REM=== Syntax: 'fixperms.bat directoryname' will iterate over each directory and set R/W/X permissions for the user named directoryname

pushd %1
for /f "delims=" %f in ('dir /b /ad') do ICACLS I:\shares\users\%f /grant %f:(OI)(CI)(M)
