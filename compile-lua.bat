@echo OFF
rmdir /S /Q out
mkdir out
%PLAYDATE_SDK_PATH%\bin\pdc --verbose src\pdx out\game
exit /b %ERRORLEVEL%
