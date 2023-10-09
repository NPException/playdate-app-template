@echo OFF
call bb compile
if NOT %ERRORLEVEL% == 0 exit /b %ERRORLEVEL%
call bb build-pdx
if NOT %ERRORLEVEL% == 0 exit /b %ERRORLEVEL%

echo == Copying Build to Simulator ==
rmdir /S /Q "%PLAYDATE_SDK_PATH%\Disk\Games\User\%CurrDirName%.pdx"
robocopy /MIR ".\builds\%CurrDirName%.pdx" "%PLAYDATE_SDK_PATH%\Disk\Games\User\%CurrDirName%.pdx" > nul

echo == Starting Simulator ==
for %%I in (.) do set CurrDirName=%%~nxI
%PLAYDATE_SDK_PATH%/bin/PlaydateSimulator.exe "./builds/%CurrDirName%.pdx"
