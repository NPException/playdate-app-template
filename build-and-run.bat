@echo OFF
call compile-fennel.bat
if NOT %ERRORLEVEL% == 0 exit /b %ERRORLEVEL%
call build-pdx.bat
if NOT %ERRORLEVEL% == 0 exit /b %ERRORLEVEL%
echo Starting Simulator ...
for %%I in (.) do set CurrDirName=%%~nxI
%PLAYDATE_SDK_PATH%\bin\PlaydateSimulator.exe ".\builds\%CurrDirName%.pdx"
