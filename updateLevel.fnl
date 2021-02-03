(fn updateInit [state params]
  (fn entityFilter [item other]
    (if
      (or (util.equals other.name [:objective :bumper :coing :coinp :gem :heart]) (and (= item.name :player) (= other.name :block)))
      "cross"
      (or (-?> other (. :layer) (. :properties) (. :passable)) (-?> other (. :properties) (. :passable)))
      "selectiveSlide"
      "slide")
  )
  (fn platformFilter [item other]
    (if (or (= other.name :platVert) (= other.name :platOriz) (= other.name :block) (-?> other (. :properties) (. :collidable)))
      :bounce
      :cross)
  )

  (fn givePoints [entity pts]
    (set state.score (+ state.score pts))
    (anim.drawFloatingText state (.. pts) entity.x entity.y 1.4)
    (if (= entity.name :gem) 
      (TEsound.play audio.gem :static)
      (TEsound.play audio.coin :static)
    )
  )

  (fn giveLife [entity qty]
    (set state.player.hp (+ state.player.hp 1))
    (anim.drawFloatingText state (.. "+" qty " HP") entity.x entity.y 1.6)
    (TEsound.play audio.heart :static)
  )

  (fn diePlayer []
    (set state.playerMorto? 0)
    ;rimuove giocatore da collisioni
    (state.world:remove state.player)
    (anim.animPlayerDeath state)
    (TEsound.play audio.explosion :static)
  )

  (fn turnAround [entity]
    (set entity.verso
      (if (= :l entity.verso)
        :r :l)))

  (fn attack [attacker target]
    (when (<= target.invinc 0)
      (TEsound.play audio.hit :static)
      (if (= target.name :player)
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
              (anim.animDeath state target)
              (givePoints target (* 5 (. params.hp target.name)))
              (lume.remove state.spriteLayer.enemies target)
              (state.world:remove target)
            )
            (do 
              (set target.invinc params.enemyInvinc) 
              true
            )
          ) ) ) ) )

  (fn update [dt set-mode]
    (local player state.player)
    (set state.dt dt)
    (set state.clock (% (+ dt state.clock) 27720))
    (set state.frame (+ 1 state.frame))
    (tset state.dts (+ 1 (% state.frame 30)) dt)
    (TEsound.cleanup)

    (when (and (lume.find state.tasti-premuti "escape") (not state.concluso?)) (set state.pausa? (not state.pausa?)))
    (when (lume.find state.tasti-premuti "d") (set state.debugMode? (not state.debugMode?)))
    ; (util.sleep 0.1)
    ; (when (lume.find state.tasti-premuti "c")
    ;   (table.insert state.drawfs (util.drawAnim state state.tilesetSprite params.tiles.explosion (/ (lg.getWidth) 2) (/ (lg.getHeight) 2))))

    (when (and (not state.pausa?) (not state.concluso?))
      ;spostamento piattaforme
      (each [_ plat (ipairs state.spriteLayer.platforms)]
        (let [startX plat.x
              startY plat.y
              (goalX goalY) (match plat.verso
                :u (values startX (- startY (* dt params.speeds.platV)))
                :d (values startX (+ startY (* dt params.speeds.platV)))
                :r (values (+ startX (* dt params.speeds.platH)) startY)
                :l (values (- startX (* dt params.speeds.platH)) startY)
                _ (error "piattaforma senza verso"))
              (destX destY collisions collisionsNumber) (state.world:move plat goalX goalY platformFilter)
              moveX (- destX startX)
              moveY (- destY startY)
              ;troviamo le entità sopra la piattaforma
              (entities numEntities) (state.world:queryRect startX (- startY 1) plat.width 1 #(or (= $1.type :enemy) (= $1.type :player)))
              ]
              (set plat.x destX)
              (set plat.y destY)
          (when (and (< 0 collisionsNumber) (lume.any collisions #(if $1.bounce true false)))
            (set plat.verso (match plat.verso
              :u :d
              :d :u
              :r :l
              :l :r
            ))
          )
          ;update per traslarle
          (when (< 0 numEntities)
            (each [_ ent (ipairs entities)]
              (when (= (+ ent.y ent.height) startY)
                (let [newX (+ ent.x moveX) 
                      newY (+ ent.y moveY)]
                  (state.world:update ent newX newY)
                  (set ent.x newX)
                  (set ent.y newY)
                )
              )
            )
          )
        )
      )

      ;spostamento giocatore
      (when (not state.playerMorto?)
        (var (xPlayer yPlayer wPlayer hPlayer) (state.world:getRect player))
        ; logica velocita giocatore
        (if (love.keyboard.isDown "right") (set player.xSpd (+ player.xSpd (* dt params.accel))))
        (if (love.keyboard.isDown "left") (set player.xSpd (- player.xSpd (* dt params.accel))))
        ; gestione salti
        (if (lume.find state.tasti-premuti "z")
          (if 
            ; discesa da piattaforma
            (and player.aTerra? (love.keyboard.isDown "down"))
              (do
                (set yPlayer (+ yPlayer 0.1))
              )
            player.aTerra?
              (do
                (set player.tSalto 0)
                (set player.ySpd (- player.ySpd params.v-salto-terra))
                (TEsound.play audio.jump :static nil nil 0.7)
              )
            player.saltoAMuro?
              (do
                (set player.ySpd (- 0 params.v-salto-muro-v))
                (set player.xSpd (if (= "left" player.saltoAMuro?) (- 0 params.v-salto-muro-h) params.v-salto-muro-h))
                (camera:unlock)
              )
            player.salto-doppio?
              (do
                ; (set player.ySpd (- 0 params.v-salto-doppio))
                ; (set player.salto-doppio? false)
              )
          )
        )

        (if (and (love.keyboard.isDown "z") player.tSalto (< player.tSalto params.durataSalto))
          (do
            (set player.tSalto (+ player.tSalto dt))
            (set player.ySpd (- player.ySpd (* dt params.a-salto-terra)))
          )
          (set player.tSalto false)
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

        ;sposta direttamente il giocatore
        (state.world:update player xPlayer yPlayer wPlayer hPlayer)

        ; logica collisioni giocatore
        (var (actualX actualY collisions collisionsNumber) (state.world:move player (+ xPlayer (* dt player.xSpd)) (+ yPlayer (* dt player.ySpd)) entityFilter))
        (set player.x actualX)
        (set player.y actualY)

        ; check saltabilita per prossimo update
        (set player.aTerra? false)
        (set player.saltoAMuro? false)
        (set player.suPiattVert? false)
        (when (> collisionsNumber 0)
          (var cols (if (= collisionsNumber 1)
            [collisions]
            collisions
          ))

          (each [_ col (ipairs collisions)]
            (when (= col.other.type :bumper)
              (set col.item.ySpd (- 0 params.v-bumper))
              (set player.salto-doppio? true)
              (camera:unlock)
              (love.audio.play audio.bumperSource)
              ; (TEsound.play audio.bumper :static)
            )
            (when (= col.other.type :coing)
              (givePoints col.other 5)
              (lume.remove state.map.layers.Sprites.coins col.other)
              (state.world:remove col.other)
            )
            (when (= col.other.type :coinp)
              (givePoints col.other 1)
              (lume.remove state.map.layers.Sprites.coins col.other)
              (state.world:remove col.other)
            )
            (when (util.equals col.other.type [:enemy :spikes])
              ;resetta state.nLivello
              (attack col.other player)
            )
            ; (print col.other.type)
            ; (print dt)
            ; (pp col.other.type)
            ; collisione con muri (per ora tutti slide)
            (when (= col.type "slide")
              (if
                ; muro verticale
                (and (not= col.normal.x 0) (= col.normal.y 0))
                (do
                  (set col.item.xSpd 0)
                  (set player.saltoAMuro? (if (< 0 col.normal.x) "right" "left"))
                )
                ; muro orizzontale
                (and (not= col.normal.y 0) (= col.normal.x 0))
                (set col.item.ySpd 0)
              )
              ; quando tocchiamo terra
              (when (and (= col.normal.x 0) (< col.normal.y 0))
                (set player.aTerra? true)
                (set player.salto-doppio? true)
              )
            )

            ; (print player.suPiattVert?)

            (when (and (= col.type "selectiveSlide") col.slide)
              (set col.item.ySpd 0)
              (set player.aTerra? true)
              (set player.salto-doppio? true)
              (when (and col.other.verso (util.equals col.other.verso [:u :d]))
                (set player.suPiattVert? true)
              )
            )

            ; quando colpiamo l'obiettivo
            (when (and (= col.item.name "player") (= col.other.name "objective"))
              (set state.concluso? true)
              (TEsound.play audio.objective :static)
              (var nomeLivello (. params.listaLivelli state.nLivello))
              (when (not (. state.hiScore nomeLivello)) (tset state.hiScore nomeLivello {:score 0}))
              (var vecchioPunteggio (or (-?> state.hiScore (. nomeLivello) (. :score)) 0))
              (when (or (< vecchioPunteggio state.score) (= vecchioPunteggio 0))
                (tset (. state.hiScore nomeLivello) :score state.score)
                (set state.nuovoHiScore? true)
                ; salva state.score a file
                (with-open [f (io.open params.pathPunteggi :w)]
                  (each [nomeLivello v (pairs state.hiScore)]
                      (f:write (.. nomeLivello ": " v.score (if v.gemma "g" "") "\n"))
                  )
                )
              )
            )
            (when (and (= col.other.type :gem) (not col.other.preso?))
              (givePoints col.other 50)
              (set col.other.preso? true)
            )

            (when (and (= col.other.type :heart) (not col.other.preso?))
              (giveLife col.other 1)
              (set col.other.preso? true)
            )

            ; quando tocchiamo il fondo
            (when (and (= col.item.name "player") (= col.other.name "border-d"))
              ;resetta state.nLivello
              (diePlayer state)
            )
          )
        )

        (set player.verso (if (= player.xSpd 0) player.verso (< player.xSpd 0) :l :r))
        (set player.state (if player.aTerra?
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
                (set player.saltoAMuro? (if (< 0 col.normal.x) "right" "left"))
        ))))

        ;logica spada
        (when (< 0 player.weapon)
          (let [ox (if (= player.verso :r) 10 -16)
                oy 7]
            (local (enemies len) (state.world:queryRect (+ player.x ox) (+ player.y oy) 16 6 #(= $1.type :enemy)))
            (each [_ enemy (ipairs enemies)]
              (when (attack player enemy)
                (set enemy.verso player.verso))
            )
          )
        )
      )

      ; logica movimento nemici
      (each [_ enemy (ipairs state.spriteLayer.enemies)]
        (set enemy.x (if (= enemy.verso :r) (+ enemy.x (* dt (. params.speeds enemy.name))) (- enemy.x (* dt (. params.speeds enemy.name)))))

        (var (actualX actualY collisions collisionsNumber) (state.world:move enemy enemy.x enemy.y entityFilter))
        (set enemy.x actualX)
        (set enemy.y actualY)

        (local instabile? (and enemy.properties.ground? (do
          (local (items len) (state.world:queryRect (+ enemy.x (/ enemy.width 2)) (+ enemy.y enemy.height 1) 1 1 
            #(or (-?> $1 (. :properties) (. :collidable)) (-?> $1 (. :properties) (. :passable)))))
          (= len 0)
        )))

        (when (or instabile? (and (> collisionsNumber 0) (lume.any collisions #(= $1.type :slide))))
          (turnAround enemy))

        (when (and (> collisionsNumber 0) (lume.any collisions #(= $1.other.name :player)))
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