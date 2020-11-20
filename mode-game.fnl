; (var levelInit (require "LevelBase"))
; (levelInit "level1")

; (var counter 0)
; (var time 0)

(var listaLivelli [:level1 :level2])
(var livello nil)

(fn sleep [s]
  (let [ntime (+ (os.clock) (/ s 10))]
    (while true
      (when (> (os.clock) ntime)
        (lua "break")))))

(var camera (require "camera"))

(var map nil)
(var world nil)
(var player nil)
(var obiet nil)

(local accel 0.03)
(local attrito 0.026)
(local salto 2.5)
(local gravita 0.015)
; (var floor {:name "floor"})
; (var lWall {:name "lWall"})
; (var rWall {:name "rWall"})
; (var ceil {:name "ceil"})
; (var rettangolo {:name "rettangolo"})
; (var obiettivoDaDisegnare true)
(fn filter [item other] 
  (if (and (= item.name "Player") (= other.name "Objective")) 
    "cross"
    "slide")
)
(var saltabile? true)

(local (wWidth wHeight) (love.graphics.getDimensions))

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

    (set player (world:add player player.x player.y player.width player.height))
    (set obiet (world:add obiet obiet.x obiet.y obiet.width obiet.height))

    (var map-width (* map.width map.tilewidth))
    (var map-height (* map.height map.tileheight))

    (set border-l (world:add border-l (- 0 1) 0 1 map-height))
    (set border-r (world:add border-r map-width 0 1 map-height))
    (set border-u (world:add border-u 0 (- 0 1) map-width 1))
    (set border-d (world:add border-d 0 map-height map-width 1))

    (set player.xSpd 0)
    (set player.ySpd 0)
    
    (var playerSprite (love.graphics.newImage "assets/player.png"))
    (var obietSprite (love.graphics.newImage "assets/objective.png"))

    (set obiet.sprite obietSprite)
    (set player.sprite playerSprite)

    (set spriteLayer.player player)
    (set spriteLayer.obiet obiet)

    (set spriteLayer.draw (fn [self]
        (love.graphics.draw self.player.sprite self.player.x self.player.y 0 1 1 0 0)
        (love.graphics.setPointSize 5)
        (love.graphics.points (math.floor self.player.x) (math.floor self.player.y))
        (love.graphics.draw self.obiet.sprite self.obiet.x self.obiet.y 0 1 1 0 0)
      )
    )

    ;(set obiet {:name "Objective"})

    ; fine dell'inizializzazione spawns
    ; (map:removeLayer "Spawn")
    (set map.layers.Spawn.visible false)

    ;(pp world)
    ; (world.add world obiet 100 10 20 20)

    ; (world.add world floor 0 wHeight wWidth 1)
    ; (world.add world lWall -1 0 1 wHeight)
    ; (world.add world rWall wWidth 0 1 wHeight)
    ; (world.add world ceil 0 -1 wWidth 1)

    ; (world.add world rettangolo 250 220 50 30)
  ) 
        
  :update (fn update [dt set-mode]
    ; (sleep 0.1)

    (var (xPlayer yPlayer wPlayer hPlayer) (world:getRect player))
    ; logica velocita giocatore
    (if (love.keyboard.isDown "right") (set player.xSpd (+ player.xSpd accel)))
    (if (love.keyboard.isDown "left") (set player.xSpd (- player.xSpd accel)))
    (if (and (love.keyboard.isDown "up") saltabile?) 
      (set player.ySpd (- player.ySpd salto))
    )
    ;(if (love.keyboard.isDown "down") (set player.ySpd (+ player.ySpd 0.05)))

    ; logica attrito 
    (set player.xSpd (- player.xSpd (* attrito player.xSpd)))
    ; (if (> player.xSpd 0)
    ;   (if (< player.xSpd attrito)
    ;     (set player.xSpd 0)
    ;     (set player.xSpd (- player.xSpd attrito))
    ;   )
    ; (< player.xSpd 0)
    ;   (if (> player.xSpd attrito)
    ;     (set player.xSpd 0)
    ;     (set player.xSpd (+ player.xSpd attrito))
    ;   )
    ; )
    ; gravita
    (set player.ySpd (+ player.ySpd gravita))

    (var (actualX actualY collisions collisionsNumber) (world:move player (+ xPlayer player.xSpd) (+ yPlayer player.ySpd) filter))
    (set player.x actualX)
    (set player.y actualY)
    ;(print xPlayer yPlayer)
    ; (pp player)

    ;(pp collisions)

    ; check saltabilita per prossimo update
    (set saltabile? false)
    (when (> collisionsNumber 0)
      (var cols (if (= collisionsNumber 1)
        [collisions]
        collisions
      ))

      ;(pp collisions)
      (each [index value (ipairs collisions)]
        (when (= value.type "slide")
          (if 
            (and (not (= value.normal.x 0)) (= value.normal.y 0))
            (set value.item.xSpd 0)
            (and (not (= value.normal.y 0)) (= value.normal.x 0))
            (set value.item.ySpd 0)
          )
          (when (and (= value.normal.x 0) (< value.normal.y 0))
            (set saltabile? true)
          )
        )
        (when (and (= value.item.name "Player") (= value.other.name "Objective"))
          ; avanza livello
          (set livello (+ livello 1))
          (if (= nil (. listaLivelli livello))
            (set-mode "mode-end")
            (set-mode "mode-game" livello)
          )
        )
        (when (and (= value.item.name "Player") (= value.other.name "border-d"))
          ;resetta livello
          (set-mode "mode-game" livello)
        )
      )
      ;(print "collisionsNumber:" collisionsNumber)
      ;(print "collisione")
    )
  )
          ;  (if (< counter 65535)
          ;      (set counter (+ counter 1))
          ;      (set counter 0))
          ;  (set time (+ time dt))
          ;  (when (> time 3)
          ;    (set-mode "mode-intro")))
    ; (love.graphics.print (: "This window should close in %0.2f seconds" :format (- 3 time)) 32 16))

  :draw (fn draw [message]
    (camera:position player)
    ; (camera:set)
    ; (love.graphics.push)
    ; (love.graphics.translate 0 (- 0 50 player.y))
    ; (love.graphics.scale 3 3)
    ; (print "player" player.x player.y)
    ; (print "camera" camera.x camera.y)
    (map:draw (- 0 camera.x) (- 0 camera.y))
    ; (love.graphics.pop)
    ; (camera:unset)
      ; (local (xPlayer yPlayer wPlayer hPlayer) (world:getRect player))
      ; (love.graphics.setColor .87 .84 .27)
      ; (love.graphics.rectangle "fill" xPlayer yPlayer wPlayer hPlayer)
      ; (when obiettivoDaDisegnare 
      ;   (local (xObiet yObiet wObiet hObiet) (world:getRect obiet))
      ;   (love.graphics.setColor .27 .24 .77)
      ;   (love.graphics.rectangle "fill" xObiet yObiet wObiet hObiet)
      ; )
      ; (local (xRett yRett wRett hRett) (world:getRect rettangolo))
      ; (love.graphics.setColor 0 0 1)
      ; (love.graphics.rectangle "fill" xRett yRett wRett hRett)
    )

  :keypressed (fn keypressed [key set-mode]
          ;(print (love.keyboard.isDown "right"))
          ;(love.graphics.print (: (tostring (love.keyboard.isDown "right")) 32 16))
          
  )
}
