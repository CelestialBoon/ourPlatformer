; (var counter 0)
; (var time 0)

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

(local attrito 0.02)
; (var floor {:name "floor"})
; (var lWall {:name "lWall"})
; (var rWall {:name "rWall"})
; (var ceil {:name "ceil"})
; (var rettangolo {:name "rettangolo"})
; (var obiettivoDaDisegnare true)
(fn filter [item other] 
  (if (and (= item.name "player") (= other.name "obiet")) 
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
    (print :playerX player.x :playerY player.y "map-width" map-width :map-height map-height :halfScreenX half-screen-x :halfScreenY half-screen-y :boundX boundX :boundY boundY)
    (camera:setPosition (/ boundX 2) (/ boundY 2))
  )
)

{:activate (fn activate [...]
    (set map (sti "assets/levels/testLevel.lua" [:bump]))
    (set world (bump.newWorld 32))

    ; (map:resize (love.graphics.getWidth) (love.graphics.getHeight))

    (map:bump_init world)

    (var spriteLayer (map:addCustomLayer "Sprites"))

    ; inizializzazione spawns
    (each [key value (pairs map.objects)]
      (when (= value.name "Player")
        (set player value)
        (lua "break")
      )
    )

    (set player (world:add player player.x player.y player.width player.height))
    (set player.xSpd 0)
    (set player.ySpd 0)
    
    (var playerSprite (love.graphics.newImage "assets/player.png"))
    (set player.sprite playerSprite)

    (set spriteLayer.player player)

    (set spriteLayer.draw (fn [self]
      (love.graphics.draw self.player.sprite self.player.x self.player.y 0 1 1 0 0)
      (love.graphics.setPointSize 5)
      (love.graphics.points (math.floor self.player.x) (math.floor self.player.y)))
    )

    ;(set obiet {:name "Objective"})

    ; fine dell'inizializzazione spawns
    (map:removeLayer "Spawn")

    ;(pp world)
    ; (world.add world obiet 100 10 20 20)

    ; (world.add world floor 0 wHeight wWidth 1)
    ; (world.add world lWall -1 0 1 wHeight)
    ; (world.add world rWall wWidth 0 1 wHeight)
    ; (world.add world ceil 0 -1 wWidth 1)

    ; (world.add world rettangolo 250 220 50 30)
  ) 
  :draw (fn draw [message]
      (camera:position player)
      (camera:set)
      ; (love.graphics.push)
      ; (love.graphics.translate 0 (- 0 50 player.y))
      ; (love.graphics.scale 3 3)
      (print "player" player.x player.y)
      (print "camera" camera.x camera.y)
      (map:draw)
      ; (love.graphics.pop)
      (camera:unset)
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
        
        ; (love.graphics.print (: "This window should close in %0.2f seconds" :format (- 3 time)) 32 16))
 :update (fn update [dt set-mode]
    

      (var (xPlayer yPlayer wPlayer hPlayer) (world:getRect player))
      ; logica velocita giocatore
      (if (love.keyboard.isDown "right") (set player.xSpd (+ player.xSpd 0.05)))
      (if (love.keyboard.isDown "left") (set player.xSpd (- player.xSpd 0.05)))
      (if (and (love.keyboard.isDown "up") saltabile?) 
        (set player.ySpd (- player.ySpd 4))
      )
      ;(if (love.keyboard.isDown "down") (set player.ySpd (+ player.ySpd 0.05)))

      ; logica attrito 
      (if (> player.xSpd 0)
        (if (< player.xSpd attrito)
          (set player.xSpd 0)
          (set player.xSpd (- player.xSpd 0.02))
        )
      (< player.xSpd 0)
        (if (> player.xSpd attrito)
          (set player.xSpd 0)
          (set player.xSpd (+ player.xSpd 0.02))
        )
      )
      ; gravita
      (set player.ySpd (+ player.ySpd 0.02))

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
          (if (and (= value.item.name "Player") (= value.other.name "Objective"))
            (set-mode "mode-end")
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
 :keypressed (fn keypressed [key set-mode]
            ;(print (love.keyboard.isDown "right"))
            ;(love.graphics.print (: (tostring (love.keyboard.isDown "right")) 32 16))
            
          )}
