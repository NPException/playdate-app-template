# TODO: give a short introduction how to get a minimal example up and running

----------------------------------------------------------------------------------------------------

`main.lua`:
```lua
function playdate.update()
  playdate.graphics.drawText("Hello *Lua* _World_", 30, 30)
end
```
----------------------------------------------------------------------------------------------------

`main.fnl`:
```fennel
(fn playdate.update []
  (playdate.graphics.drawText "Hello *Fennel* _World_" 30 30))
```