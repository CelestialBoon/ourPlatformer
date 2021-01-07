(var titleScreen (love.graphics.newImage "lib/assets/titleScreen.png"))

{
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
        (if (= key "return")
            (set-mode "mode-game" 1)
        )
    )
    :activate nil
}