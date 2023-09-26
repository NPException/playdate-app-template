import "CoreLibs/graphics"

local pd <const> = playdate
local gfx <const> = pd.graphics

local playerX, playerY = 200, 120
local playerRadius = 10
local playerSpeed = 3

function pd.update()
  gfx.clear()
  if pd.buttonIsPressed("up") and not pd.isCrankDocked() then
    local crankAngle = math.rad(pd.getCrankPosition())
    playerX = playerX + math.sin(crankAngle) * playerSpeed
    playerY = playerY - math.cos(crankAngle) * playerSpeed
  end
  gfx.fillCircleAtPoint(playerX, playerY, playerRadius)
end