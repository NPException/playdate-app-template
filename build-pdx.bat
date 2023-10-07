@echo OFF
echo == Running Playdate Compiler ==
for %%I in (.) do set CurrDirName=%%~nxI
rmdir /S /Q builds
mkdir builds
%PLAYDATE_SDK_PATH%\bin\pdc src\pdx ".\builds\%CurrDirName%"
if NOT %ERRORLEVEL% == 0 exit /b %ERRORLEVEL%
: copy the built game to the Simulator (so it can be seen in the main menu)
echo == Copying Build to Simulator ==
rmdir /S /Q "%PLAYDATE_SDK_PATH%\Disk\Games\User\%CurrDirName%.pdx"
robocopy /MIR ".\builds\%CurrDirName%.pdx" "%PLAYDATE_SDK_PATH%\Disk\Games\User\%CurrDirName%.pdx" > nul
exit /b 0
