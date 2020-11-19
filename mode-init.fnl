{
    :update (fn update [dt set-mode]
        ; ????
    )
    :draw (fn draw []
        ; disegna inizia gioco (magari slampeggiante)
        (love.graphics.print "Inizia gioco" 100 100)
    )
    :keypressed (fn keypressed [key set-mode]
        ; se preme invio, comincia gioco
        (print key)
        (if (= key "return")
            (set-mode "mode-game")
        )
    )
    :activate nil
}