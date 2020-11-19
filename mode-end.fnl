


{
    :update (fn update [dt set-mode]
        ; ????
    )
    :draw (fn draw []
        (love.graphics.print "Game over" 100 100)
    )
    :keypressed (fn keypressed [key set-mode]
        ; se preme invio, chiude gioco
        ;(print key)
        (if (= key "return")
            (love.event.quit)
        )
    )
    :activate nil
}