(fn drawFloatingText [state text x y scale]
  (let [spd params.floatTextSpeed
        duration params.floatTextDuration
        scale (or scale 1)
        ]
    (var (x y) (camera:screenPos x y))
    (var time 0)
    (table.insert state.drawRoutines (fn draw []
      (when (< time duration)
        (love.graphics.print text x y 0 scale scale)
        (set y (- y (* state.dt spd)))
        (set time (+ time state.dt))
        draw
      )
    ))
  )
)

(fn drawTileFromImage [image {: tx : ty} x y scale]
  (love.graphics.draw image (love.graphics.newQuad
    (* tx 16) (* ty 16)
    16 16
    (image:getDimensions))
    ; posizione e rotazione
    x y 0
    ;scala
    scale ) )

(fn animFrame [state flen tick]
  (var start state.clock)
  (var i 0)
  (if (= (type tick) :number)
    (fn []
      (local f (math.floor (/ (- state.clock start) tick)))
      (if (< f flen) f nil)
    )
    (fn []
      (if (> (- state.clock start) (. tick (+ i 1)))
        (do (set i (+ 1 i)) (set start (+ start (. tick i))) (when (< i flen) i))
        i ) ) ) )

(fn drawAnim [state image tiledata x y scale]
  (local framefn (animFrame state tiledata.flen tiledata.tick))
  (fn draw []
    (let [fr (framefn)
          (x y) (camera:screenPos x y)]
      (when fr
        (love.graphics.draw image 
          (love.graphics.newQuad (* 16 (+ fr tiledata.tx)) (* 16 tiledata.ty) 16 16 (image:getDimensions))
           x y 0 (or scale tiledata.scale))
        draw ) ) ) )

(fn animDeath [state entity]
  (table.insert state.drawRoutines (drawAnim state state.tilesetSprite params.tiles.explosion (- entity.x 4) (- entity.y 4)))
)

(fn animPlayerDeath [state]
    (let [image state.tilesetSprite
          tiledata params.tiles.explosion
          fnframe (animFrame state tiledata.flen tiledata.tick)
          (x y) (camera:screenPos state.player.x state.player.y)]
      (table.insert state.drawRoutines (fn draw []
        (let [fr (fnframe)]
          (if fr (do
              (set state.playerMorto? fr)
              (love.graphics.draw image 
                (love.graphics.newQuad (* 16 (+ fr tiledata.tx)) (* 16 tiledata.ty) 16 16 (image:getDimensions))
                x y 0 tiledata.scale)
              draw
              )
            (do
              (set state.playerMorto? true)
              nil) ) ) )) ) )

{: drawFloatingText : drawTileFromImage : animDeath : animPlayerDeath}