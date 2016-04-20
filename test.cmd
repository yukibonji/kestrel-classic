start /b build\kestrel-classic.exe > output.log 2> errorOutput.log
timeout 2
taskkill /IM kestrel-classic.exe /F

for /f %%i in ("errorOutput.log") do set size=%%~zi
if %size% gtr 0 exit /B 1
