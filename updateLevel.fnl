(fn updateInit [state params]
  (fn filter [item other] 
    (if 
      (and (= item.name :Player) (util.equals other.name [:Objective :bumper :coing :coinp :gem]))
      "cross"
      "slide")
  )

  (fn attack [attacker target]
    (when (<= target.invinc 0)
      (print (.. attacker.name " danneggia " target.name))
      (if (= target.name :Player)
        (do
          (set target.hp (- target.hp 1))
          (if (<= target.hp 0)
            ;giocatore morto
            (set state.playerDead? true)
            (set target.invinc params.playerInvinc)
          )
        )
        (do
          (set target.hp (- target.hp 1))
          (if (<= target.hp 0)
            (do 
              (lume.remove state.spriteLayer.enemies target)
              (state.world:remove target))
            (set target.invinc params.enemyInvinc)
          )
        )
      )
    )
  )

  (fn update [dt set-mode]
    (local player state.player)
    (set state.dt dt)
    (if (and (lume.find state.tasti-premuti "escape") (not state.concluso?)) (set state.pausa? (not state.pausa?)))
    ; (sleep 0.1)
    (when (and (not state.pausa?) (not state.concluso?))
      (var (xPlayer yPlayer wPlayer hPlayer) (state.world:getRect player))
      ; logica velocita giocatore
      (if (love.keyboard.isDown "right") (set player.xSpd (+ player.xSpd params.accel)))
      (if (love.keyboard.isDown "left") (set player.xSpd (- player.xSpd params.accel)))
      ; gestione salti
      (if (lume.find state.tasti-premuti "z") 
        (if state.a-terra?
          (set player.ySpd (- player.ySpd params.v-salto-terra))
          state.salto-a-muro?
          (do
            (set player.ySpd (- 0 params.v-salto-muro-v))
            (set player.xSpd (if (= "left" state.salto-a-muro?) (- 0 params.v-salto-muro-h) params.v-salto-muro-h))
            ;(print "salto a muro verso " state.salto-a-muro?)
          )
          state.salto-doppio?
          (do 
            (set player.ySpd (- 0 params.v-salto-doppio))
            (set state.salto-doppio? false)
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
      (set player.xSpd (- player.xSpd (* params.attrito player.xSpd)))

      ; params.gravita
      (set player.ySpd (+ player.ySpd params.gravita))

      ; logica collisioni giocatore
      (do 
        (var (actualX actualY collisions collisionsNumber) (state.world:move player (+ xPlayer player.xSpd) (+ yPlayer player.ySpd) filter))
        (set player.x actualX)
        (set player.y actualY)

        ; check saltabilita per prossimo update
        (set state.a-terra? false)
        (set state.salto-a-muro? false)
        (when (> collisionsNumber 0)
          (var cols (if (= collisionsNumber 1)
            [collisions]
            collisions
          ))

          (each [_ col (ipairs collisions)]
            (when (= col.other.type :bumper)
              (set col.item.ySpd (- 0 params.v-bumper))
              (set state.salto-doppio? true)
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
                  (set state.salto-a-muro? (if (< 0 col.normal.x) "right" "left"))
                )
                ; muro orizzontale
                (and (not= col.normal.y 0) (= col.normal.x 0))
                (set col.item.ySpd 0)
              )
              ; quando tocchiamo terra
              (when (and (= col.normal.x 0) (< col.normal.y 0))
                (set state.a-terra? true)
                (set state.salto-doppio? true)
              )
            )

            ; quando colpiamo l'obiettivo
            (when (and (= col.item.name "Player") (= col.other.name "Objective"))
              (set state.concluso? true)
              (var nomeLivello (. params.listaLivelli state.nLivello))
              (var vecchioPunteggio (or (. state.punteggi nomeLivello) 0))
              (when (< vecchioPunteggio state.punteggio)
                (tset state.punteggi nomeLivello state.punteggio)
                (set state.nuovoHiScore? true)
                ; salva state.punteggio a file
                (with-open [f (io.open params.pathPunteggi :w)]
                  (each [nomeLivello v (pairs state.punteggi)]
                      (f:write (.. nomeLivello ": " v.score (if v.gemma "g") "\n"))
                  )
                )
              )
            )
            (when (= col.other.type :gem)
              (set state.gemma.presa? true)
            )
            ; quando tocchiamo il fondo
            (when (and (= col.item.name "Player") (= col.other.name "border-d"))
              ;resetta state.nLivello
              (set-mode "mode-game" state.nLivello)
            )
          )
        ) 
      
        (set player.verso (if (= player.xSpd 0) player.verso (< player.xSpd 0) :l :r))
        (set player.state (if state.a-terra?
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
      )

      ; controllo di prossimita walljump
      (let [(items len) (state.world:project {} (- player.x 1) (- player.y 1) 
                            (+ params.playerWidth 2) (+ params.playerHeight 2) 
                            (- player.x 1) (- player.y 1) 
                            #(and $2.properties $2.properties.collidable))]
        (when (> len 0)
          (each [_ col (ipairs items)]
            (when (and (not= col.normal.x 0) (= col.normal.y 0))
              (set state.salto-a-muro? (if (< 0 col.normal.x) "right" "left"))
      ))))

      ;logica spada
      (when (< 0 player.weapon)
        (let [ox (if (= player.verso :r) 10 -16) 
              oy 7]
          (local (enemies len) (state.world:queryRect (+ player.x ox) (+ player.y oy) 16 6 #(= $1.type :enemy)))
          (each [_ enemy (ipairs enemies)]
            ; (print (.. "removing " enemy.properties.name))
            (attack player enemy)
          )
        )
      )

      ; logica movimento nemici
      (each [_ enemy (ipairs state.spriteLayer.enemies)]
        (set enemy.x (if (= enemy.verso :r) (+ enemy.x (. params.speeds enemy.name)) (- enemy.x (. params.speeds enemy.name))))

        (var (actualX actualY collisions collisionsNumber) (state.world:move enemy enemy.x enemy.y filter))
        (set enemy.x actualX)
        (set enemy.y actualY)

        (local instabile? (and enemy.properties.ground? (do
          (local (items len) (state.world:queryRect (+ enemy.x (/ enemy.width 2)) (+ enemy.y enemy.height 1) 1 1 #$1.properties.collidable))
          (= len 0)
        )))

        (when (or instabile? (> collisionsNumber 0)) (set enemy.verso (if (= enemy.verso :l) :r :l)))

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
    (when (<= player.hp 0)
      (set-mode "mode-game" state.nLivello)
    )
  )
)