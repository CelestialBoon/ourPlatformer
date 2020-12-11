(import-macros {: icollect} :macros)

(fn activateInit [state params camera]
  (fn nextFrame [tabl max tick dt]
    (set tabl.time (+ tabl.time dt))
    (when (> tabl.time tick)
      (set tabl.frame (if (>= tabl.frame max) 0 (+ tabl.frame 1)))
      (set tabl.time (- tabl.time tick))
    )
    tabl.frame
  )

  (fn activate [numLivello ...]
    (set state.nLivello (or numLivello 1))
    (set state.map (sti (.. "assets/levels/" (. params.listaLivelli state.nLivello) ".lua") [:bump]))
    (set state.world (bump.newWorld 32))
    (set state.creatureCanvas (lg.newCanvas 
              (* state.map.width state.map.tilewidth) 
              (* state.map.height state.map.tileheight)))

    (each [line (io.lines params.pathPunteggi)]
        (local (level score gemma) (string.match line "(.*): (%d+)(g?)"))
        (tset state.punteggi level {:score (tonumber score) :gemma (= gemma "g")})
    )

    (set state.punteggio 0)

    ; (state.map:resize (lg.getWidth) (lg.getHeight))

    (state.map:bump_init state.world)

    (var border-l {:name "border-l"})
    (var border-r {:name "border-r"})
    (var border-u {:name "border-u"})
    (var border-d {:name "border-d"})

    (set state.spriteLayer (state.map:addCustomLayer "Sprites"))
    (set state.spriteLayer.sprites {})
    (set state.spriteLayer.coins [])
    (set state.spriteLayer.enemies [])
    (set state.spriteLayer.gems [])

    ; inizializzazione spawns
    (each [key value (pairs state.map.objects)]
      (when (= value.name "Player")
        (set state.player value)
        ;(lua "break")
      )
      (when (= value.name "Objective")
        (set state.obiet value)
      )
    )

    (macro addCollidable [typ prop sprite?]
      `(when (= tile.type ,typ)
        (local gid# (+ tileset.firstgid tile.id))
        (when (. state.map.tileInstances gid#)
          (icollect [_# instance# (ipairs (. state.map.tileInstances gid#))]
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
        )))
    ) )

    (each [_ tileset (ipairs state.map.tilesets)]
      (each [i tile (ipairs tileset.tiles)]
        (when (= tile.type :enemy)
          (let [
                enemyName tile.properties.name
                (ox oy w h) (match enemyName
                              :bat (values 2 2 9 8)
                              :slime (values 1 6 14 9))
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
                :verso :r
                :hp (. params.hp enemyName)
                :invinc 0
              })
              (: state.world "add" e e.x e.y e.width e.height)
              (table.insert state.map.bump_collidables e)
              (table.insert state.spriteLayer.enemies e)
        ) ) ))
        (let [a (addCollidable :coing {
          :height 6
          :width 6
          :x 5
          :y 9
          :name :coing
        } true)]
          (set state.spriteLayer.coins (lume.concat state.spriteLayer.coins a)))
        (let [a (addCollidable :coinp {
          :height 4
          :width 4
          :x 6
          :y 11
          :name :coinp
        } true)]
          (set state.spriteLayer.coins (lume.concat state.spriteLayer.coins a)))
        (let [a (addCollidable :gem {
          :height 16
          :width 16
          :x 0
          :y 0
          :name :gem
        } true)] 
          (set state.spriteLayer.gems (lume.concat state.spriteLayer.gems a)))
        (addCollidable :bumper {
          :height 2
          :width state.map.tileheight
          :x 0
          :y 14
          :name :bumper
        } false) 
      )
    )

    ; forse sara necessario rendere il layer solo invisibile in futuro
    (state.map:removeLayer "Invisible")

    (set state.player (state.world:add state.player state.player.x state.player.y params.playerWidth params.playerHeight))
    (set state.obiet (state.world:add state.obiet state.obiet.x state.obiet.y state.obiet.width state.obiet.height))

    (var map-width (* state.map.width state.map.tilewidth))
    (var map-height (* state.map.height state.map.tileheight))

    (set border-l (state.world:add border-l (- 0 1) 0 1 map-height))
    (set border-r (state.world:add border-r map-width 0 1 map-height))
    (set border-u (state.world:add border-u 0 (- 0 1) map-width 1))
    (set border-d (state.world:add border-d 0 map-height map-width 1))

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
    })

    (set state.gemma (. state.spriteLayer.gems 1))
    (set state.gemma.presa? (. (. state.punteggi (. params.listaLivelli state.nLivello) state.gemma)))

    (set state.spriteLayer.sprites.obiet (or state.spriteLayer.sprites.obiet (lg.newImage "assets/objective.png")))
    (set state.spriteLayer.sprites.gemma (or state.spriteLayer.sprites.gemma (lg.newImage "assets/sprites/gem.png")))
    (set state.spriteLayer.sprites.player (or state.spriteLayer.sprites.player (lg.newImage "assets/sprites/protag.png")))
    (set state.spriteLayer.sprites.coins (or state.spriteLayer.sprites.coins (lg.newImage "assets/sprites/coin.png")))
    (set state.spriteLayer.sprites.enemies (or state.spriteLayer.sprites.enemies (lg.newImage "assets/sprites/enemies.png")))

    (set state.spriteLayer.player state.player)
    (set state.spriteLayer.obiet state.obiet)

    (set state.spriteLayer.draw (fn [self]
      ;cambio canvas
      (var oldCanvas (lg.getCanvas))
      (lg.setCanvas state.creatureCanvas)
      (lg.clear)
      (lg.push)
      ; (lg.origin)
      ; (lg.translate (- 0 camera.x) (- 0 camera.y))
      ; (lg.scale params.scale)
      (lg.translate (math.floor (/ camera.x 2)) (math.floor (/ camera.y 2)))

      ; disegna giocatore
      ; determina il frame
      (var (playerRow playerColumn) (match self.player.state
        :idle  (values 0 0)
        :jumpu (values 1 0)
        :jumpd (values 1 1)
        :run   (values 2 (nextFrame self.player 3 .15 state.dt))
      ))

      (lg.draw self.sprites.player (lg.newQuad
        (* playerColumn 16) 
        (* playerRow 16) 
        16 16 
        (self.sprites.player:getDimensions))
        ; posizione e rotazione
        self.player.x self.player.y 0
        ;scala 
        (if (= state.player.verso :l) -1 1) 1
        ;offset
        (if (= state.player.verso :r) (values 3 0) (values 13 0))
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

      ;disegna nemici
      (each [_ enemy (ipairs state.spriteLayer.enemies)]
        (var (enemyRow enemyAnimLength enemyAnimSpeed ox oy) (match enemy.name 
          :bat (values 0 3 .30 0 0)
          :slime (values 1 3 .60 0 1)       
        ))
        (var enemyColumn (nextFrame enemy (- enemyAnimLength 1) enemyAnimSpeed state.dt))
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
      )

      ;cambio canvas
      ; (lg.pop)
      ; (lg.push)
      ; (lg.origin)
      ; (lg.scale params.scale)
      (lg.setCanvas oldCanvas)
      (lg.draw state.creatureCanvas)
      (lg.pop)

      (lg.draw self.sprites.obiet self.obiet.x self.obiet.y 0 1 1 0 0)

      (when (not state.gemma.presa?) (lg.draw state.spriteLayer.sprites.gemma state.gemma.x state.gemma.y 0 1 1 0 0))

      ; disegna monete
      (local coinColumn (nextFrame state.theCoin 3 .10 state.dt))
      (each [_ coin (ipairs state.spriteLayer.coins)]
        (local coinRow (match coin.type
                              :coing 0
                              :coinp 2
        ))
        (lg.draw state.spriteLayer.sprites.coins (lg.newQuad
          (* coinColumn 16) 
          (* coinRow 16) 
          16 16 
          (state.spriteLayer.sprites.coins:getDimensions))
          ; posizione e rotazione
          coin.x coin.y 0 1 1
          5 9
        )
      )
    ))


    (var bgLayer (state.map:addCustomLayer "background" 1))

    (var mainbgSprite (lg.newImage (.. "assets/backgrounds/" state.map.properties.season "BG.png")))

    (set bgLayer.draw (fn [self] 
      (lg.setBackgroundColor 
        (match state.map.properties.season
          :spring (values 0.282 0.4 0.773 1)
          :summer (values 0 0 0 1)
          :fall   (values 0 0 0 1)
          :winter (values 0 0 0 1)
        ))
      (var bgx (* camera.x 0.8))
      (var bgy (- (* camera.y 0.8) 200))
      (var bgscale 3)
      (lg.draw mainbgSprite 
        ; x y rot
        bgx bgy 0
        ; scala
        bgscale
      )
    ))

    ; fine dell'inizializzazione spawns
    ; (state.map:removeLayer "Spawn")
    (set state.map.layers.Spawn.visible false)
  )
)