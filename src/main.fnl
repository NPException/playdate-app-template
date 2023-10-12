; Example pong game based on https://wiki.fennel-lang.org/pong ported for Playdate
(import-macros
  {: GENERATED_HEADER
   : const}
  :macros/macros)
(GENERATED_HEADER)

(import :CoreLibs/graphics)

(const pd playdate)
(const gfx pd.graphics)

(pd.display.setRefreshRate 50

(local (w h) (pd.display.getSize))
(local (speed ball-speed) (values 10 (/ w 4)))
(local keys {:up [:left -1] :down [:left 1]
             :a [:right -1] :b [:right 1]})

(var state nil)

(fn initialize []
  (set state {:x 50 :y 50 :dx 2 :dy 1 :left 10 :right 10})
  (pd.resetElapsedTime))

(initialize)

(fn on-paddle? []
  (or (and (< state.x 20)
           (< state.left state.y (+ state.left 100)))
      (and (< (- w 20) state.x)
           (< state.right state.y (+ state.right 100)))))


(fn pd.update []
  ; "calculate" delta time since last frame
  (local dt (pd.getElapsedTime))
  (pd.resetElapsedTime)

  ; update ball position
  (set state.x (+ state.x (* state.dx dt ball-speed)))
  (set state.y (+ state.y (* state.dy dt ball-speed)))

  ; update player positions based on input
  (each [key action (pairs keys)]
    (let [[player dir] action]
      (when (pd.buttonIsPressed key)
        (tset state player (+ (. state player) (* dir speed))))))

  ; ball bounce from floor or ceiling
  (when (or (< state.y 0) (> state.y h))
    (set state.dy (- 0 state.dy)))

  ; reverse ball direction when touching paddle
  (when (on-paddle?)
    (set state.dx (- 0 state.dx)))

  ; check if someone won and reset game
  (when (< state.x 0)
    (gfx.drawText "*Right player wins*" (/ w 3) (/ h 3))
    (pd.wait 2000)
    (initialize))

  (when (> state.x w)
    (gfx.drawText "*Left player wins*" (/ w 3) (/ h 3))
    (pd.wait 2000)
    (initialize))

  ; draw the scene
  (gfx.clear)
  (gfx.fillRect 10 state.left 10 100)
  (gfx.fillRect (- w 20) state.right 10 100)
  (gfx.fillCircleAtPoint state.x state.y 10))
