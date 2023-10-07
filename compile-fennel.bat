@echo OFF
echo == Compiling Fennel ==
if not exist src\pdx\_generated\ (
  mkdir src\pdx\_generated
)
cd src\fnl

:: list of all to-be-compiled fennel files (TODO: make this a loop, so I only need to add filenames. Or even walk ALL .fnl files in the directory)
fennel --compile main.fnl > ..\pdx\_generated\main.lua
if not %ERRORLEVEL% == 0 exit /b %ERRORLEVEL%
:: fennel --compile util.fnl >..\pdx\generated\util.lua
:: if not %ERRORLEVEL% == 0 exit /b %ERRORLEVEL%

cd ..\..
