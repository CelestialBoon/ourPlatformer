(var titleScreen (love.graphics.newImage "lib/assets/titleScreen.png"))

{:activate (fn activate [] 
    (each [_ fileName (ipairs params.audio)]
      (tset audio fileName (or (. audio fileName) (love.sound.newSoundData (.. "lib/assets/audio/" fileName ".wav"))))
    )
    (TEsound.playLooping "lib/assets/audio/introSong.wav" :stream :music nil 0.5)
    (print :3)
  )

  :update (fn update [dt set-mode]
    ; ????
  )
  :draw (fn draw []
    ; disegna inizia gioco (magari slampeggiante)
    (love.graphics.draw titleScreen 0 0)
    (love.graphics.print "Inizia gioco" 310 200)
  )
  :keypressed (fn keypressed [key set-mode]
    ; se preme invio, comincia gioco
    (when (= key "return")
      (TEsound.stop "music")
      (set-mode "mode-game" 1)
    )
  )
}