@echo OFF
echo == Running Playdate Compiler ==
for %%I in (.) do set CurrDirName=%%~nxI
rmdir /S /Q builds
mkdir builds
%PLAYDATE_SDK_PATH%\bin\pdc src\pdx ".\builds\%CurrDirName%"
exit /b %ERRORLEVEL%
