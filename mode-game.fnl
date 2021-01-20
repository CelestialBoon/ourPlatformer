(local activateInit (require :activateLevel))
(local updateInit (require :updateLevel))

(local state {
  :nLivello nil
  :dt 0
  :clock 0
  :dts []
  :frame 0
  :tasti-premuti []
  :pausa? false
  :concluso? false
  :playerMorto? false
  :debugMode? false
  
  :gemma nil
  :hiScore {}
  :punteggio 0
  :nuovoHiScore? false

  :map nil
  :world nil
  :player nil

  :shader (lg.newShader "lib/assets/shader.fs")
  :drawfs []
})

(local (wWidth wHeight) (love.graphics.getDimensions))

{
  : state

  :activate (activateInit state params)
        
  :update (updateInit state params)

  :draw (fn draw [message]
    (camera:position)
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
    (for [i 1 state.player.hp]
      (anim.drawTileFromImage state.tilesetSprite params.tiles.uiheart (+ 10 (* i 20)) 10 2)
    )

    ;debug mode
    (when state.debugMode?
      (lg.setColor 1 0 0 .7)
      (each [_ e (ipairs state.map.bump_collidables)]
        (let [(x y) (camera:screenPos e.x e.y)]
          (lg.rectangle "fill" x y (* params.scale e.width) (* params.scale e.height))))
      (when (> state.player.weapon 0)
        (let [player state.player
              (x y) (camera:screenPos (+ player.x (if (= player.verso :r) 10 -16)) (+ player.y 7))]
          (lg.rectangle "fill" x y (* params.scale 16) (* params.scale 6))
      ))
      (lg.setColor 1 1 1 1)
    )
    ;fine debug mode
    
    (love.graphics.print (.. "Punteggio: " state.punteggio) (- wWidth 100) 10)
    (love.graphics.print (.. "FPS: " (math.floor (/ 1 (util.average state.dts)))) (- wWidth 100) 30)
    (set state.drawfs (icollect [_ f (ipairs state.drawfs)] (f)))
  )

  :keypressed (fn keypressed [key set-mode]
    (table.insert state.tasti-premuti key)
  )
}
