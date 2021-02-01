(import-macros {: icollect2} "lib.macros")

(fn activateInit [state params]
  (fn nextFrame [nFrames tick]
    (% (math.floor (/ state.clock tick)) nFrames)
  )

  (fn activate [numLivello ...]
    (set state.nLivello (or numLivello 1))
    (set state.concluso? false)
    (set state.map (sti (.. "lib/assets/levels/" (. params.listaLivelli state.nLivello) ".lua") [:bump]))
    (set state.map.properties.season (or state.map.properties.season :spring))
    (let [prop (state.map:getLayerProperties "Platforms")] 
      (when (not= nil prop)
        (tset prop :passable true)
      )
    )
    (set state.world (bump.newWorld 32))

    (camera:initialize state)

    (let [file (io.open params.pathPunteggi)]
      (when (not= file nil)
        (each [l (file:lines)]
          (local (level score gemma) (string.match l "(.*): (%d+)(g?)"))
          (tset state.hiScore level {:score (tonumber score) :gemma (= gemma "g")})
        )
      )
    )

    (let [selectiveSlide (fn [world col x y w h goal-x goal-y filter]
      (var (goal-x goal-y) (values (or goal-x x) (or goal-y y)))
      (let [(tch move) (values col.touch col.move)
            (x y) (if (and (or (not= move.x 0) (> move.y 0)) (>= tch.y y) (< col.normal.y 0))
                      (do (set goal-y tch.y)
                          (set col.slide {:x goal-x :y goal-y})
                          (values tch.x tch.y))
                      (values x y))
      ]
        (local (cols len) (world:project col.item x y w h goal-x goal-y filter))
        (values goal-x goal-y cols len)
      ))]
      (state.world:addResponse :selectiveSlide selectiveSlide)
    )
	
    (set state.score 0)

    ; (state.map:resize (lg.getWidth) (lg.getHeight))

    (state.map:bump_init state.world)

    (var border-l {:name "border-l"})
    (var border-r {:name "border-r"})
    ; (var border-u {:name "border-u"})
    (var border-d {:name "border-d"})

    (set state.spriteLayer (state.map:addCustomLayer "Sprites"))
    (util.merge state.spriteLayer {
      :sprites {} 
      :coins []
      :enemies []
      :items []
      :platforms []
    })

    (macro addCollidable [typ prop sprite?]
      `(when (= tile.type ,typ)
        (local gid# (+ tileset.firstgid tile.id))
        (when (. state.map.tileInstances gid#)
          (icollect2 [_# instance# (ipairs (. state.map.tileInstances gid#))]
            (let [c# {
                :height ,prop.height
                :width ,prop.width
                :x (+ instance#.x state.map.offsetx ,prop.x)
                :y (+ instance#.y state.map.offsety ,prop.y)
                :layer (if ,sprite? state.spriteLayer instance#.layer)
                :name ,prop.name
                :properties tile.properties
                :type tile.type
              }]
              (state.world:add c# c#.x c#.y c#.width c#.height)
              (table.insert state.map.bump_collidables c#)
              c#
    )))))

    (each [_ tileset (ipairs state.map.tilesets)]
      (each [i tile (ipairs tileset.tiles)]
        (when (= tile.type :enemy)
          (let [
                enemyName tile.properties.name
                (ox oy w h) (match enemyName
                              :bat (values 2 2 9 8)
                              :slime (values 1 6 14 9)
                              :ghost (values 2 0 12 13)
                              :spider (values 3 7 10 9)
                )
                gid (+ tileset.firstgid tile.id)
               ]
          (when (. state.map.tileInstances gid)
            (each [_ instance (ipairs (. state.map.tileInstances gid))]
              (local e {
                :height h
                :width w
                :x (+ instance.x state.map.offsetx ox)
                :y (+ instance.y state.map.offsety oy)
                :layer state.spriteLayer
                :name enemyName
                :properties tile.properties
                :type tile.type
                :ox ox
                :oy oy
                :time 0
                :frame 0
                :verso tile.properties.verso
                :hp (. params.hp enemyName)
                :invinc 0
              })
              (: state.world "add" e e.x e.y e.width e.height)
              (table.insert state.map.bump_collidables e)
              (table.insert state.spriteLayer.enemies e)
        ) ) ))
        (let [ls (addCollidable :player {
          :height params.playerHeight
          :width params.playerWidth
          :x params.playerX
          :y params.playerY
          :name :player
        } true)]
          (when ls (set state.player (. ls 1))))
        (let [ls (addCollidable :coing {
          :height 6
          :width 6
          :x 5
          :y 9
          :name :coing
        } true)]
          (when ls (set state.spriteLayer.coins (lume.concat state.spriteLayer.coins ls))))
        (let [ls (addCollidable :coinp {
          :height 4
          :width 4
          :x 6
          :y 11
          :name :coinp
        } true)]
          (when ls (set state.spriteLayer.coins (lume.concat state.spriteLayer.coins ls))))
        (let [ls (addCollidable :gem {
          :height 16
          :width 16
          :x 0
          :y 0
          :name :gem
        } true)]
          (when ls (set state.spriteLayer.items (lume.concat state.spriteLayer.items ls))))
        (let [ls (addCollidable :heart {
          :height 16
          :width 16
          :x 0
          :y 0
          :name :heart
        } true)]
          (when ls (set state.spriteLayer.items (lume.concat state.spriteLayer.items ls))))
        (let [ls (addCollidable :objective {
          :height 14
          :width 14
          :x 1
          :y 1
          :name :objective
        } false)]
          (when ls (table.insert state.spriteLayer.items (. ls 1)) ))
        (addCollidable :block {
          :height 16
          :width 16
          :x 0
          :y 0
          :name :block
        } false)
        (addCollidable :bumper {
          :height 2
          :width state.map.tileheight
          :x 0
          :y 14
          :name :bumper
        } false)
        (let [ls (addCollidable :platVert {
          :height 16
          :width 16
          :x 0
          :y 0
          :name :platVert
        } true)]
          (when ls (each [_ plat (ipairs ls)]
              (tset plat :verso :u)
              (table.insert state.spriteLayer.platforms plat)
            )
          )
        )
        (let [ls (addCollidable :platOriz {
          :height 16
          :width 48
          :x 0
          :y 0
          :name :platOriz
        } true)]
          (when ls
            (when ls (each [_ plat (ipairs ls)]
                (tset plat :verso :r)
                (table.insert state.spriteLayer.platforms plat)
              )
            )
          )
        )
      )
    )
    
    ; forse sara necessario rendere il layer solo invisibile in futuro
    (state.map:removeLayer "Entities")

    (local player state.player)

    (var map-width (* state.map.width state.map.tilewidth))
    (var map-height (* state.map.height state.map.tileheight))

    (set border-l (state.world:add border-l (- 0 1) 0 1 map-height))
    (set border-r (state.world:add border-r map-width 0 1 map-height))
    ; (set border-u (state.world:add border-u 0 (- 0 1) map-width 1))
    (set border-d (state.world:add border-d 0 map-height map-width 1))

    (let [collidable {:properties {:collidable true}}]
      (util.merge border-l collidable)
      (util.merge border-r collidable)
      ; (util.merge border-u collidable)
      (util.merge border-d collidable)
    )

    (util.merge state.player {
      :xSpd 0
      :ySpd 0
      :verso :r
      :state :idle
      :hp params.hp.player
      :time 0
      :frame 1
      :weapon 0
      :invinc 0
      :aTerra? false
      :saltoAMuro? false
      :saltoDoppio? true
    })
    (set state.gemma (lume.match state.spriteLayer.items #(= $1.name :gem)))
    (set state.gemma.preso? (-?> state.hiScore (. (. params.listaLivelli state.nLivello)) (. :gemma)))

    (set state.tilesetSprite (or state.tilesetSprite (lg.newImage "lib/assets/SeasonsTilesheet.png")))
    (var mainbgSprite (lg.newImage (.. "lib/assets/backgrounds/" state.map.properties.season ".png")))
    (set state.spriteLayer.sprites.player (or state.spriteLayer.sprites.player (lg.newImage "lib/assets/sprites/protag.png")))
    (set state.spriteLayer.sprites.coins (or state.spriteLayer.sprites.coins (lg.newImage "lib/assets/sprites/coin.png")))
    (set state.spriteLayer.sprites.enemies (or state.spriteLayer.sprites.enemies (lg.newImage "lib/assets/sprites/enemies.png")))

    (set state.spriteLayer.player state.player)

    (set state.spriteLayer.draw (fn [self]
      ;disegna nemici
      (each [_ enemy (ipairs state.spriteLayer.enemies)]
        (var (enemyRow enemyAnimLength enemyAnimSpeed ox oy) (match enemy.name
          :bat (values 0 3 .30 0 0)
          :slime (values 1 3 .60 0 1)
          :ghost (values 2 3 .60 0 0)
          :spider (values 3 3 .60 0 0)
        ))
        (var enemyColumn (nextFrame enemyAnimLength enemyAnimSpeed))

        (when (< 0 enemy.invinc)
          (if (< 0.15 (% enemy.invinc 0.3))
            (lg.setColor 1 0 0 1)
            (lg.setColor 0.5 0 0 1))
          (lg.setShader state.shader)
        )
        (lg.draw state.spriteLayer.sprites.enemies (lg.newQuad
          (* enemyColumn 16)
          (* enemyRow 16)
          16 16
          (state.spriteLayer.sprites.enemies:getDimensions))
          ; posizione e rotazione
          (+ ox enemy.x) (+ oy enemy.y) 0
          ;scala
          (if (= enemy.verso :r) 1 -1) 1
          ;offset
          (if (= enemy.verso :r) (values enemy.ox enemy.oy) (values (- 16 enemy.ox) enemy.oy))
        )
        (when (< 0 enemy.invinc)
          (lg.setShader)
          (lg.setColor 1 1 1 1)
        )
      )

      (each [_ item (ipairs state.spriteLayer.items)]
        (when (not item.preso?)
          (anim.drawTileFromImage state.tilesetSprite (. params.tiles item.name) item.x item.y)
        )
      )
      
      ; disegna monete
      (local coinColumn (nextFrame 3 .10))
      (each [_ coin (ipairs state.spriteLayer.coins)]
        (local (coinRow coinOx coinOy) (match coin.type
                              :coing (values 0 5 9)
                              :coinp (values 2 6 11)
        ))
        (lg.draw state.spriteLayer.sprites.coins (lg.newQuad
          (* coinColumn 16)
          (* coinRow 16)
          16 16
          (state.spriteLayer.sprites.coins:getDimensions))
          ; posizione e rotazione
          coin.x coin.y 0 1 1
          coinOx coinOy
        )
      )

      ;disegna piattaforme semoventi
      (each [_ plat (ipairs state.spriteLayer.platforms)]
        (let [(x y w h) (match plat.name
                :platOriz (values 0 13 48 16)
                :platVert (values 2 12 16 16)
                )
              quad (lg.newQuad (* 16 x) (* 16 y) w h (state.tilesetSprite:getDimensions))]
          (lg.draw state.tilesetSprite quad plat.x plat.y)
        )
      )
      
      (when (= false state.playerMorto?)
      ; disegna giocatore
        ; determina il frame
        (var (playerRow playerColumn) (match self.player.state
          :idle  (values 0 0)
          :jumpu (values 1 0)
          :jumpd (values 1 1)
          :run   (values 2 (nextFrame 4 .15))
        ))

        (when (< 0 player.invinc)
          (if (< 0.15 (% player.invinc 0.3))
            (lg.setColor 1 0 0 1)
            (lg.setColor 0.5 0 0 1))
          (lg.setShader state.shader)
        )
        (lg.draw self.sprites.player (lg.newQuad
          (* playerColumn 16)
          (* playerRow 16)
          16 16
          (self.sprites.player:getDimensions))
          ; posizione e rotazione
          (math.floor self.player.x) (math.floor self.player.y) 0
          ;scala
          (if (= state.player.verso :l) -1 1) 1
          ;offset
          (if (= state.player.verso :r) (values 3 0) (values 13 0))
        )
        (when (< 0 player.invinc)
          (lg.setShader)
          (lg.setColor 1 1 1 1)
        )

        ;disegna spada
        (when (> state.player.weapon 0)
        (lg.draw self.sprites.player (lg.newQuad
          16 0
          16 16
          (self.sprites.player:getDimensions))
          ; posizione e rotazione
          self.player.x self.player.y 0
          ;scala
          (if (= state.player.verso :l) -1 1) 1
          ;offset
          (if (= state.player.verso :r) (values -10 -2) (values 0 -2))
        ))
      )
    ))

    (var bgLayer (state.map:addCustomLayer "background" 1))

    (set bgLayer.draw (fn [self]
      ; parallasse
      (local (wWidth wHeight) (lg.getDimensions)) ;schermo
      (local (iWidth iHeight) (mainbgSprite:getDimensions)) ;sfondo
      (local (lWidth lHeight) (values (* state.map.width state.map.tilewidth) (* state.map.height state.map.tileheight))) ;livello

      (local xRatio (math.min 0.2 (math.abs (/ iWidth (- lWidth wWidth)))))
      (local yRatio (math.min 0.2 (math.abs (/ iHeight (- lHeight wHeight)))))
      
      (var bgx (* camera.x (- 1 xRatio)))
      (var bgy (- (* camera.y (- 1 yRatio)) 100))
      (var bgscale 3)

      (match state.map.properties.season
          :spring (do
            (lg.setBackgroundColor (values 0.282 0.4 0.773 1))
            ; draw sfondo
            (lg.draw mainbgSprite (lg.newQuad
                0 0 160 144
                (mainbgSprite:getDimensions)
              )
              ; x y rot
              bgx bgy 0
              ; scala
              bgscale
            )
            ; draw acqua
            (lg.draw mainbgSprite (lg.newQuad
              0 (+ (* 32 (nextFrame 2 1)) 144) 160 32
              (mainbgSprite:getDimensions)
              )
              bgx (+ (* bgscale 96) bgy) 0 bgscale
            )
          )
          :summer (do
            (lg.setBackgroundColor (values 0.282 0.4 0.773 1))
            ; draw sfondo
            (lg.draw mainbgSprite (lg.newQuad
                0 0 160 144
                (mainbgSprite:getDimensions)
              )
              ; x y rot
              bgx bgy 0
              ; scala
              bgscale
            )
            ; sole
            (lg.draw state.tilesetSprite (lg.newQuad
                80 0 16 16
                (state.tilesetSprite:getDimensions)
              )
              ; x y rot
              (- camera.x -100 (* 0.1 bgx)) (+ 120 bgy) 0
              ; scala
              bgscale
            )
            ; riflessi mare (causano righe orizzontali blu a caso)
            (for [i 0 9]
              (lg.draw mainbgSprite (lg.newQuad
                (* 16 (nextFrame 2 1)) 144 16 16 (mainbgSprite:getDimensions))
                (+ bgx (* bgscale 16 i)) (+ bgy (* bgscale 95)) 0 
                bgscale
              )
            )
          )
          :fall (do
            (lg.setBackgroundColor (values 0.31 0.247 0.443 1))
            ; draw sfondo
            (lg.draw mainbgSprite (lg.newQuad
                0 0 160 144
                (mainbgSprite:getDimensions)
              )
              ; x y rot
              bgx bgy 0
              ; scala
              bgscale
            )
          )
          :winter (do
            (lg.setBackgroundColor (values 0.31 0.247 0.443 1))
            ; draw sfondo
            (lg.draw mainbgSprite (lg.newQuad
                0 0 160 144
                (mainbgSprite:getDimensions)
              )
              ; x y rot
              bgx bgy 0
              ; scala
              bgscale
            )
            (if (= 0 (nextFrame 2 1))
              ; stelle grosse
              (let [pos [[0 3] [2 2] [6 4] [8 2]]]
                (each [_ [x y] (ipairs pos)]
                  (lg.draw mainbgSprite (lg.newQuad
                    16 144 16 16
                    (mainbgSprite:getDimensions))
                    (+ bgx (* x bgscale 16)) (+ bgy (* y bgscale 16)) 0
                    bgscale
                  )
                )
              )
              ; stelle piccole
              (let [pos [[1 3] [3 4] [5 2] [7 3] [9 4]]]
                (each [_ [x y] (ipairs pos)]
                  (lg.draw mainbgSprite (lg.newQuad
                    0 144 16 16
                    (mainbgSprite:getDimensions))
                    (+ bgx (* x bgscale 16)) (+ bgy (* y bgscale 16)) 0
                    bgscale
                  )
                )
              )
            )
          )
    )))

    ; fine dell'inizializzazione spawns
    ; (state.map:removeLayer "Spawn")
    ; (set state.map.layers.Spawn.visible false)
  )
)