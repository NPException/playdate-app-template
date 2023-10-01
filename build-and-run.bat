@echo OFF
echo == Compiling Fennel code ==
call compile-fennel.bat
if NOT %ERRORLEVEL% == 0 exit /b %ERRORLEVEL%
echo == Compiling LUA ==
call compile-lua.bat
if NOT %ERRORLEVEL% == 0 exit /b %ERRORLEVEL%
echo Starting Simulator ...
%PLAYDATE_SDK_PATH%\bin\PlaydateSimulator.exe .\out\game.pdx
