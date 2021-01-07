(fn updateInit [state params]
  (fn filter [item other]
    (if
      (and (= item.name :Player) (util.equals other.name [:objective :block :bumper :coing :coinp :gem :heart]))
      "cross"
      (and (= item.name :Player) (-?> other (. :layer) (. :properties) (. :passable)))
      "selectiveSlide"
      "slide")
  )

  (fn diePlayer []
    (set state.playerMorto? 0)
    ;rimuove giocatore da collisioni
    (state.world:remove state.player)
    (util.animPlayerDeath state)
  )

  (fn turnAround [entity]
    (set entity.verso
      (if (= :l entity.verso)
        :r :l)))

  (fn attack [attacker target]
    (when (<= target.invinc 0)
      ; (print (.. attacker.name " danneggia " target.name))
      (if (= target.name :Player)
        (do
          (set target.hp (- target.hp 1))
          (when (> target.hp 0)
            (set target.invinc params.playerInvinc)
            true
          )
        )
        (do
          (set target.hp (- target.hp 1))
          (if (<= target.hp 0)
            (do
              (util.animDeath state target)
              (lume.remove state.spriteLayer.enemies target)
              (state.world:remove target))
            (do (set target.invinc params.enemyInvinc) true) ) ) ) ) )

  (fn update [dt set-mode]
    (local player state.player)
    (set state.dt dt)
    (set state.clock (% (+ dt state.clock) 27720))
    (set state.frame (+ 1 state.frame))
    (tset state.dts (+ 1 (% state.frame 30)) dt)

    (when (and (lume.find state.tasti-premuti "escape") (not state.concluso?)) (set state.pausa? (not state.pausa?)))
    (when (lume.find state.tasti-premuti "d") (set state.debugMode? (not state.debugMode?)))
    ; (sleep 0.1)
    ; (when (lume.find state.tasti-premuti "c")
    ;   (table.insert state.drawfs (util.drawAnim state state.tilesetSprite params.tiles.explosion (/ (lg.getWidth) 2) (/ (lg.getHeight) 2))))

    (when (and (not state.pausa?) (not state.concluso?))
      (when (not state.playerMorto?)
        (var (xPlayer yPlayer wPlayer hPlayer) (state.world:getRect player))
        ; logica velocita giocatore
        (if (love.keyboard.isDown "right") (set player.xSpd (+ player.xSpd params.accel)))
        (if (love.keyboard.isDown "left") (set player.xSpd (- player.xSpd params.accel)))
        ; gestione salti
        (if (lume.find state.tasti-premuti "z")
          (if player.a-terra?
            (set player.ySpd (- player.ySpd params.v-salto-terra))
            player.salto-a-muro?
            (do
              (set player.ySpd (- 0 params.v-salto-muro-v))
              (set player.xSpd (if (= "left" player.salto-a-muro?) (- 0 params.v-salto-muro-h) params.v-salto-muro-h))
              ;(print "salto a muro verso " player.salto-a-muro?)
            )
            player.salto-doppio?
            (do
              (set player.ySpd (- 0 params.v-salto-doppio))
              (set player.salto-doppio? false)
            )
          )
        )
        ; a 0 la spada è disattivata
        (when (> player.weapon 0) (set player.weapon (+ player.weapon dt)))
        (when (> player.weapon params.weaponDuration) (set player.weapon 0))
        (when (and (lume.find state.tasti-premuti "x") (= 0 player.weapon))
          (set player.weapon dt)
        )

        ; logica params.attrito
        (set player.xSpd (- player.xSpd (* params.attrito dt player.xSpd)))

        ; params.gravita
        (set player.ySpd (+ player.ySpd (* dt params.gravita)))

        ; logica collisioni giocatore

        (var (actualX actualY collisions collisionsNumber) (state.world:move player (+ xPlayer (* dt player.xSpd)) (+ yPlayer (* dt player.ySpd)) filter))
        (set player.x actualX)
        (set player.y actualY)

        ; check saltabilita per prossimo update
        (set player.a-terra? false)
        (set player.salto-a-muro? false)
        (when (> collisionsNumber 0)
          (var cols (if (= collisionsNumber 1)
            [collisions]
            collisions
          ))

          (each [_ col (ipairs collisions)]
            (when (= col.other.type :bumper)
              (set col.item.ySpd (- 0 params.v-bumper))
              (set player.salto-doppio? true)
            )
            (when (and (= col.item.name :Player) (= col.other.type :coing))
              (set state.punteggio (+ state.punteggio 5))
              (lume.remove state.map.layers.Sprites.coins col.other)
              (state.world:remove col.other)
            )
            (when (and (= col.item.name :Player) (= col.other.type :coinp))
              (set state.punteggio (+ state.punteggio 1))
              (lume.remove state.map.layers.Sprites.coins col.other)
              (state.world:remove col.other)
            )
            (when (and (= col.item.name :Player) (= col.other.type :enemy))
              ;resetta state.nLivello
              (attack col.other player)
            )
            ; collisione con muri (per ora tutti slide)
            (when (= col.type "slide")
              (if
                ; muro verticale
                (and (not= col.normal.x 0) (= col.normal.y 0))
                (do
                  (set col.item.xSpd 0)
                  (set player.salto-a-muro? (if (< 0 col.normal.x) "right" "left"))
                )
                ; muro orizzontale
                (and (not= col.normal.y 0) (= col.normal.x 0))
                (set col.item.ySpd 0)
              )
              ; quando tocchiamo terra
              (when (and (= col.normal.x 0) (< col.normal.y 0))
                (set player.a-terra? true)
                (set player.salto-doppio? true)
              )
            )

            (when (and (= col.type "selectiveSlide") col.slide)
              (set col.item.ySpd 0)
              (set player.a-terra? true)
              (set player.salto-doppio? true)
            )

            ; quando colpiamo l'obiettivo
            (when (and (= col.item.name "Player") (= col.other.name "objective"))
              (set state.concluso? true)
              (var nomeLivello (. params.listaLivelli state.nLivello))
              (when (not (. state.hiScore nomeLivello)) (tset state.hiScore nomeLivello {:score 0}))
              (var vecchioPunteggio (or (-?> state.hiScore (. nomeLivello) (. :score)) 0))
              (when (or (< vecchioPunteggio state.punteggio) (= vecchioPunteggio 0))
                (tset (. state.hiScore nomeLivello) :score state.punteggio)
                (set state.nuovoHiScore? true)
                ; salva state.punteggio a file
                (with-open [f (io.open params.pathPunteggi :w)]
                  (each [nomeLivello v (pairs state.hiScore)]
                      (f:write (.. nomeLivello ": " v.score (if v.gemma "g" "") "\n"))
                  )
                )
              )
            )
            (when (and (= col.other.type :gem) (not col.other.preso?))
              (set state.punteggio (+ state.punteggio 50))
              (set col.other.preso? true)
            )

            (when (and (= col.other.type :heart) (not col.other.preso?))
              (set player.hp (+ player.hp 1))
              (set col.other.preso? true)
            )

            ; quando tocchiamo il fondo
            (when (and (= col.item.name "Player") (= col.other.name "border-d"))
              ;resetta state.nLivello
              (diePlayer state)
            )
          )
        )

        (set player.verso (if (= player.xSpd 0) player.verso (< player.xSpd 0) :l :r))
        (set player.state (if player.a-terra?
          (if (< (math.abs player.xSpd) params.v-idle)
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


        ; controllo di prossimita walljump
        (let [(items len) (state.world:project {} (- player.x 1) (- player.y 1)
                              (+ params.playerWidth 2) (+ params.playerHeight 2)
                              (- player.x 1) (- player.y 1)
                              #(-?> $2 (. :layer) (. :properties) (. :passable) (not)))]
          (when (> len 0)
            (each [_ col (ipairs items)]
              (when (and (not= col.normal.x 0) (= col.normal.y 0))
                (set player.salto-a-muro? (if (< 0 col.normal.x) "right" "left"))
        ))))

        ;logica spada
        (when (< 0 player.weapon)
          (let [ox (if (= player.verso :r) 10 -16)
                oy 7]
            (local (enemies len) (state.world:queryRect (+ player.x ox) (+ player.y oy) 16 6 #(= $1.type :enemy)))
            (each [_ enemy (ipairs enemies)]
              ; (print (.. "removing " enemy.properties.name))
              (when (attack player enemy)
                (set enemy.verso player.verso))
            )
          )
        )
      )

      ; logica movimento nemici
      (each [_ enemy (ipairs state.spriteLayer.enemies)]
        (set enemy.x (if (= enemy.verso :r) (+ enemy.x (* dt (. params.speeds enemy.name))) (- enemy.x (* dt (. params.speeds enemy.name)))))

        (var (actualX actualY collisions collisionsNumber) (state.world:move enemy enemy.x enemy.y filter))
        (set enemy.x actualX)
        (set enemy.y actualY)

        (local instabile? (and enemy.properties.ground? (do
          (local (items len) (state.world:queryRect (+ enemy.x (/ enemy.width 2)) (+ enemy.y enemy.height 1) 1 1 #(-?> $1 (. :properties) (. :collidable))))
          (= len 0)
        )))

        (when (or instabile? (> collisionsNumber 0)) (turnAround enemy))

        (when (and (> collisionsNumber 0) (lume.any collisions #(= $1.other.name :Player)))
          (attack enemy player)
        )
        (set enemy.invinc (math.max 0 (- enemy.invinc dt)))
      )
      (set player.invinc (math.max 0 (- player.invinc dt)))
    )

    (when (and state.concluso? (lume.find state.tasti-premuti "return"))
      ; prossimo livello
      (set state.nLivello (+ state.nLivello 1))
      (if (= nil (. params.listaLivelli state.nLivello))
        (set-mode "mode-end")
        (set-mode "mode-game" state.nLivello)
      )
    )

    (set state.tasti-premuti [])

    (when (and (not state.playerMorto?) (<= player.hp 0))
      (diePlayer state)
    )

    (when (= true state.playerMorto?)
      (set state.playerMorto? false)
      (set-mode "mode-game" state.nLivello)
    )
  )
)