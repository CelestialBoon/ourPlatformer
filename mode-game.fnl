(var listaLivelli [:level1 :level2])
(var livello nil)

(var tasti-premuti [])
(var pausa? false)
(var det 0)

(fn sleep [s]
  (let [ntime (+ (os.clock) (/ s 10))]
    (while true
      (when (> (os.clock) ntime)
        (lua "break")))))

(fn filter [item other] 
  (if 
    (and (= item.name :Player) (or (= other.name :Objective) (= other.type :bumper))) 
    "cross"
    "slide")
)

(fn nextFrame [tabl dt max]
  (set tabl.time (+ tabl.time dt))
  (when (> tabl.time tabl.tick)
    (set tabl.frame (if (>= tabl.frame max) 0 (+ tabl.frame 1)))
    (set tabl.time (- tabl.time tabl.tick))
  )
  tabl.frame
)

(var camera (require "camera"))

(var map nil)
(var world nil)
(var player nil)
(var obiet nil)

(local scale 3)

(local playerTick .15)
(local playerScale 1)
(local playerWidth 10)
(local playerHeight 16)

(local accel 0.005)
(local attrito 0.013)
(local v-salto-terra 0.7)
(local v-salto-muro-v .6)
(local v-salto-muro-h .7)
(local v-salto-doppio 0.5)
(local v-bumper 1)
(local gravita 0.004)
(local v-idle 0.001)

(var a-terra? false)
(var salto-a-muro? false)
(var salto-doppio? true)

(var (wWidth wHeight) (love.graphics.getDimensions))
(set wWidth (/ wWidth scale))
(set wHeight (/ wHeight scale))

(fn camera.position [self player]
  (let [  map-width (* map.width map.tilewidth) 
          map-height (* map.height map.tileheight) 
          half-screen-x (/ wWidth 2) 
          half-screen-y (/ wHeight 2) ]
    (var boundX (if (< player.x (- map-width half-screen-x))
        (math.max 0 (- player.x half-screen-x))
        (math.min (- player.x half-screen-x) (- map-width wWidth))))
    (var boundY (if (< player.y (- map-height half-screen-y))
        (math.max 0 (- player.y half-screen-y))
        (math.min (- player.y half-screen-y) (- map-height wHeight))))
    ; (print :playerX player.x :playerY player.y "map-width" map-width :map-height map-height :halfScreenX half-screen-x :halfScreenY half-screen-y :boundX boundX :boundY boundY)
    (camera:setPosition boundX boundY)
  )
)

{
  :activate (fn activate [numLivello ...]
    (set livello (or numLivello 1))
    (set map (sti (.. "assets/levels/" (. listaLivelli livello) ".lua") [:bump]))
    (set world (bump.newWorld 32))

    ; (map:resize (love.graphics.getWidth) (love.graphics.getHeight))

    (map:bump_init world)

    ; (each [_ coll (ipairs map.bump_collidables)]
    ;   (each [_ coll2 (pairs coll.layer.data)]
    ;     (each [_ coll3 (pairs coll2)]
    ;       ; (pp coll2)
    ;       (when (= coll3.type :bumper)
    ;         (print :bumper!)
    ;         (pp coll3)
    ;       )
    ;     )
    ;   )
    ;   ; (pp coll)
    ; )

    (var border-l {:name "border-l"})
    (var border-r {:name "border-r"})
    (var border-u {:name "border-u"})
    (var border-d {:name "border-d"})

    (var spriteLayer (map:addCustomLayer "Sprites"))

    ; inizializzazione spawns
    (each [key value (pairs map.objects)]
      (when (= value.name "Player")
        (set player value)
        ;(lua "break")
      )
      (when (= value.name "Objective")
        (set obiet value)
      )
    )

    (each [_ tileset (ipairs map.tilesets)]
      (each [_ tile (ipairs tileset.tiles)]
        (when (= tile.type :bumper)
          (local gid (+ tileset.firstgid tile.id))
          (when (. map.tileInstances gid)
            (each [_ instance (ipairs (. map.tileInstances gid))]
              (local t {
                :height 2
                :width map.tileheight
                :x (+ instance.x map.offsetx)
                :y (+ instance.y map.offsety 14)
                :layer instance.layer
                :name "bumper"
                :properties tile.properties
                :type tile.type
              })
              (: world "add" t t.x t.y t.width t.height)
              (table.insert map.bump_collidables t)
            )
          )
        )
      )
    )

    ; (each [index value (ipairs map.tilesets.tiles)]
    ;     (print :bumper!)
    ;   )
    ; )

    (set player (world:add player player.x player.y playerWidth playerHeight))
    (set obiet (world:add obiet obiet.x obiet.y obiet.width obiet.height))

    (var map-width (* map.width map.tilewidth))
    (var map-height (* map.height map.tileheight))

    (set border-l (world:add border-l (- 0 1) 0 1 map-height))
    (set border-r (world:add border-r map-width 0 1 map-height))
    (set border-u (world:add border-u 0 (- 0 1) map-width 1))
    (set border-d (world:add border-d 0 map-height map-width 1))

    (set player.xSpd 0)
    (set player.ySpd 0)
    (set player.verso :r)

    (set player.time 0)
    (set player.tick playerTick)
    (set player.frame 1)
    
    (var playerSprite (love.graphics.newImage "assets/sprites/protag.png"))
    (var obietSprite (love.graphics.newImage "assets/objective.png"))

    (set obiet.sprite obietSprite)
    (set player.sprite playerSprite)

    (set spriteLayer.player player)
    (set spriteLayer.obiet obiet)

    (set spriteLayer.draw (fn [self]
        ; determina il frame
        (var (r c) (match self.player.state
          :idle  (values 0 0)
          :jumpu (values 1 0)
          :jumpd (values 1 1)
          :run   (values 2 (nextFrame self.player det 3))
        ))

        ; draw player
        (love.graphics.draw self.player.sprite (love.graphics.newQuad
          (* c 16) 
          (* r 16) 
          16 16 
          (self.player.sprite:getDimensions))
          ; posizione e rotazione
          self.player.x self.player.y 0
          ;scala 
          (* (if (= player.verso :l) -1 1) playerScale) playerScale
          ;offset
          (if (= player.verso :r) (values 3 0) (values 13 0))
        )
        (love.graphics.setPointSize 5)
        (love.graphics.points (math.floor self.player.x) (math.floor self.player.y))
        (love.graphics.draw self.obiet.sprite self.obiet.x self.obiet.y 0 1 1 0 0)
      )
    )

    (var bgLayer (map:addCustomLayer "background" 1))

    (var mainbgSprite (love.graphics.newImage (.. "assets/backgrounds/" map.properties.season "BG.png")))

    (set bgLayer.draw (fn [self] 
      (love.graphics.setBackgroundColor 
        (match map.properties.season
          :spring (values 0.282 0.4 0.773 1)
          :summer (values 0 0 0 1)
          :fall   (values 0 0 0 1)
          :winter (values 0 0 0 1)
        ))
      (var bgx (* camera.x 0.8))
      (var bgy (- (* camera.y 0.8) 200))
      (var bgscale 3)
      ; (when (> (+ camera.x (love.graphics.getWidth)) (+ bgx (* (mainbgSprite.getWidth) bgscale))
      ;   (love.graphics.draw mainbgSprite 
      ;   ; x y rot
      ;   (+ bgx (* (mainbgSprite.getWidth) bgscale)) bgy  0
      ;   ; scala
      ;   bgscale
      ; )
      ; )
      (love.graphics.draw mainbgSprite 
        ; x y rot
        bgx bgy 0
        ; scala
        bgscale
      )
    ))

    ; fine dell'inizializzazione spawns
    ; (map:removeLayer "Spawn")
    (set map.layers.Spawn.visible false)
  ) 
        
  :update (fn update [dt set-mode]
    (set det dt)
    (if (lume.find tasti-premuti "escape") (set pausa? (not pausa?)))
    ; (sleep 0.1)
    (when (not pausa?)
      (var (xPlayer yPlayer wPlayer hPlayer) (world:getRect player))
      ; logica velocita giocatore
      (if (love.keyboard.isDown "right") (set player.xSpd (+ player.xSpd accel)))
      (if (love.keyboard.isDown "left") (set player.xSpd (- player.xSpd accel)))
      ; gestione salti
      (if (lume.find tasti-premuti "up") 
        (if a-terra?
          (set player.ySpd (- player.ySpd v-salto-terra))
          salto-a-muro?
          (do
            (set player.ySpd (- 0 v-salto-muro-v))
            (set player.xSpd (if (= "left" salto-a-muro?) (- 0 v-salto-muro-h) v-salto-muro-h))
            ;(print "salto a muro verso " salto-a-muro?)
          )
          salto-doppio?
          (do 
            (set player.ySpd (- 0 v-salto-doppio))
            (set salto-doppio? false)
          )
        )
      )

      ; logica attrito 
      (set player.xSpd (- player.xSpd (* attrito player.xSpd)))

      ; gravita
      (set player.ySpd (+ player.ySpd gravita))

      (var (actualX actualY collisions collisionsNumber) (world:move player (+ xPlayer player.xSpd) (+ yPlayer player.ySpd) filter))
      (set player.x actualX)
      (set player.y actualY)

      ; check saltabilita per prossimo update
      (set a-terra? false)
      (set salto-a-muro? false)
      (when (> collisionsNumber 0)
        (var cols (if (= collisionsNumber 1)
          [collisions]
          collisions
        ))

        ;(pp collisions)
        (each [_ col (ipairs collisions)]
          ; collisione con muri (per ora tutti slide)
          (when (= col.other.type :bumper)
            (set col.item.ySpd (- 0 v-bumper))
            (set salto-doppio? true)
          )
          ; (pp col.other)
          (when (= col.type "slide")
            (if 
              ; muro verticale
              (and (not= col.normal.x 0) (= col.normal.y 0))
              (do 
                (set col.item.xSpd 0)
                (set salto-a-muro? (if (< 0 col.normal.x) "right" "left"))
              )
              ; muro orizzontale
              (and (not= col.normal.y 0) (= col.normal.x 0))
              (set col.item.ySpd 0)
            )
            ; quando tocchiamo terra
            (when (and (= col.normal.x 0) (< col.normal.y 0))
              (set a-terra? true)
              (set salto-doppio? true)
            )
          )

          ; quando colpiamo l'obiettivo
          (when (and (= col.item.name "Player") (= col.other.name "Objective"))
            ; avanza livello
            (set livello (+ livello 1))
            (if (= nil (. listaLivelli livello))
              (set-mode "mode-end")
              (set-mode "mode-game" livello)
            )
          )
          ; quando tocchiamo il fondo
          (when (and (= col.item.name "Player") (= col.other.name "border-d"))
            ;resetta livello
            (set-mode "mode-game" livello)
          )
        )
        
      )
      (set player.verso (if (= player.xSpd 0) player.verso (< player.xSpd 0) :l :r))
      (set player.state (if a-terra?
        (if (< (math.abs player.xSpd) v-idle)
          ; stato idle : fermo e per terra
          "idle"
          ; stato corsa: per terra e velocita nonnulla
          "run"
        )
        ; stato jumpu e jumpd: in aria e salendo/scendendo
        (< player.ySpd 0)
        "jumpu"
        "jumpd"
        )
      )
    )
    (set tasti-premuti [])
  )

  :draw (fn draw [message]
    (camera:position player)
    ; (camera:set)
    ; (love.graphics.push)
    ; (love.graphics.translate 0 (- 0 50 player.y))
    ; (love.graphics.scale 3 3)
    (map:draw (- 0 camera.x) (- 0 camera.y) scale)
    (when pausa?
      (love.graphics.print "Pausa" (/ wWidth 2) (/ wHeight 2))
    )
    ; (love.graphics.pop)
    ; (camera:unset)
    )

  :keypressed (fn keypressed [key set-mode]
    (table.insert tasti-premuti key)
  )
}
