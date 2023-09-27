(import-macros {: import : const : generated-header} :macros)
(generated-header)

(import "CoreLibs/graphics")

(const pd playdate)
(const gfx pd.graphics)

(local player {:x      200
               :y      120
               :radius 10
               :speed  3})

(fn pd.update []
  (gfx.clear)
  (when (and (pd.buttonIsPressed :up)
             (not (pd.isCrankDocked)))
    (let [crank-angle (math.rad (pd.getCrankPosition))]
      (set player.x (+ player.x
                       (* (math.sin crank-angle)
                          player.speed)))
      (set player.y (- player.y
                       (* (math.cos crank-angle)
                          player.speed)))))
  (gfx.fillCircleAtPoint player.x player.y player.radius))
