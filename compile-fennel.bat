mkdir src\pdx\generated
cd src\fnl

:: list of all to-be-compiled fennel files
fennel --compile code.fnl >..\pdx\generated\code.lua
:: fennel --compile util.fnl >..\pdx\generated\util.lua

cd ..\..