-----------------------------------------------------
-- this file is generated. do not modify manually. --
-----------------------------------------------------

import "CoreLibs/graphics"
local pd <const> = playdate
local gfx <const> = pd.graphics
local player = {x = 200, y = 120, radius = 10, speed = 3}
pd.update = function()
  gfx.clear()
  if (pd.buttonIsPressed("up") and not pd.isCrankDocked()) then
    local crank_angle = math.rad(pd.getCrankPosition())
    player.x = (player.x + (math.sin(crank_angle) * player.speed))
    player.y = (player.y - (math.cos(crank_angle) * player.speed))
  else
  end
  return gfx.fillCircleAtPoint(player.x, player.y, player.radius)
end
return pd.update
