(fn sleep [s]
  (let [ntime (+ (os.clock) (/ s 10))]
    (while true
      (when (> (os.clock) ntime)
        (lua "break")))))

(fn equals [a bs]
  (var result false)
  (each [_ v (ipairs bs)]
    (when (= a v) (set result true)))
  result)

(fn merge [t1 t2]
  (each [k v (pairs t2)]
    (tset t1 k v)
  )
)

(fn average [ns]
  (var tot 0)
  (each [_ n (ipairs ns)]
    (set tot (+ tot n))
  )
  (/ tot (length ns))
)

(fn drawTileFromImage [image {: tx : ty} x y scale]
  (love.graphics.draw image (love.graphics.newQuad
    (* tx 16) (* ty 16)
    16 16
    (image:getDimensions))
    ; posizione e rotazione
    x y 0
    ;scala
    scale
  )
)

(fn animFrame [state flen tick]
  (var start state.clock)
  (var i 0)
  (if (= (type tick) :number)
    (fn []
      (local f (math.floor (/ (- state.clock start) tick)))
      (print flen tick f)
      (if (< f flen) f nil)
    )
    (fn []
      (if (> (- state.clock start) (. tick (+ i 1)))
        (do (set i (+ 1 i)) (set start (+ start (. tick i))) (when (< i flen) i))
        i
      )
    )
  )
)

(fn drawAnim [state image tiledata x y scale]
  (local frame (animFrame state tiledata.flen tiledata.tick))
  (fn draw []
    (let [fr (frame)]
      (when fr
        (love.graphics.draw image 
          (love.graphics.newQuad (* 16 (+ fr tiledata.tx)) (* 16 tiledata.ty) 16 16 (image:getDimensions))
           x y 0 (or scale tiledata.scale))
        draw
      )
    )
  )
)

(fn animPlayerDeath [state]
    (let [image state.tilesetSprite
          tiledata params.tiles.explosion
          fnframe (animFrame state tiledata.flen tiledata.tick)
          (x y) (camera:relPos state.player.x state.player.y)]
      (table.insert state.drawfs (fn draw []
        (let [fr (fnframe)]
          (if fr (do
              (set state.playerMorto? fr)
              (love.graphics.draw image 
                (love.graphics.newQuad (* 16 (+ fr tiledata.tx)) (* 16 tiledata.ty) 16 16 (image:getDimensions))
                (* params.scale x) (* params.scale y) 0 tiledata.scale)
              draw
              )
            (do
              (set state.playerMorto? true)
              nil) ) ) )) ) )

{: sleep : equals : merge : average : drawTileFromImage : drawAnim : animPlayerDeath}
