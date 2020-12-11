(var camera (require "camera"))
(local activateInit (require :activateLevel))
(local updateInit (require :updateLevel))

(local params (require :params))

(local state {
  :nLivello nil
  :dt 0
  :tasti-premuti []
  :pausa? false
  :concluso? false
  
  :gemma nil
  :punteggi {}
  :punteggio 0
  :nuovoHiScore? false
  :playerDead? false

  :map nil
  :world nil
  :player nil
  :obiet nil
  :theCoin {
    :time 0
    :frame 0
  }
  :creatureCanvas nil

  :a-terra? false
  :salto-a-muro? false
  :salto-doppio? true
})

(local (wWidth wHeight) (love.graphics.getDimensions))
(local (scaledWidth scaledHeight) (values (/ wWidth params.scale) (/ wHeight params.scale)))

(fn camera.position [self]
  (let [  map-width (* state.map.width state.map.tilewidth) 
          map-height (* state.map.height state.map.tileheight) 
          half-screen-x (/ scaledWidth 2) 
          half-screen-y (/ scaledHeight 2) ]
    (var boundX (if (< state.player.x (- map-width half-screen-x))
        (math.max 0 (- state.player.x half-screen-x))
        (math.min (- state.player.x half-screen-x) (- map-width scaledWidth))))
    (var boundY (if (< state.player.y (- map-height half-screen-y))
        (math.max 0 (- state.player.y half-screen-y))
        (math.min (- state.player.y half-screen-y) (- map-height scaledHeight))))
    ; (print :playerX state.player.x :playerY state.player.y "map-width" map-width :map-height map-height :halfScreenX half-screen-x :halfScreenY half-screen-y :boundX boundX :boundY boundY)
    (camera:setPosition boundX boundY)
  )
)

{
  :activate (activateInit state params camera)
        
  :update (updateInit state params)

  :draw (fn draw [message]
    (camera:position)
    ; (camera:set)
    ; (love.graphics.push)
    ; (love.graphics.translate 0 (- 0 50 state.player.y))
    ; (love.graphics.params.scale 3 3)
    (state.map:draw (- 0 camera.x) (- 0 camera.y) params.scale)
    (when state.pausa?
      (love.graphics.print "Pausa" (/ wWidth 2) (/ wHeight 2))
    )
    (when state.concluso?
      (love.graphics.print "Congratulations!" (/ wWidth 2) (/ wHeight 2))
      (when state.nuovoHiScore? 
        (love.graphics.print (.. "Nuovo high score: " state.punteggio "!") (/ wWidth 2) (+ (/ wHeight 2) 10))
      )
    )
    ; (love.graphics.pop)
    ; (camera:unset)
    (love.graphics.print (.. "Punteggio: " state.punteggio) (- wWidth 100) 10)
  )

  :keypressed (fn keypressed [key set-mode]
    (table.insert state.tasti-premuti key)
  )
}
