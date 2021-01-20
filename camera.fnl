(var camera {:x 0 :y 0
    :versoPrec :r :stateX :lock :ox 0 :rangeXL 0 :rangeXR 0
    :stateY :unlocked :yPlat 0 :oy 0
    })
(util.merge camera params.camera)

(var state nil)

(fn camera.initialize [self theState]
  (set state theState)
  (let [(wWidth wHeight) (love.graphics.getDimensions)
        scaledWidth (/ wWidth params.scale)
        scaledHeight (/ wHeight params.scale)]
  (set self.wWidth scaledWidth)
  (set self.wHeight scaledHeight)
  (set self.mapWidth (* state.map.width state.map.tilewidth))
  (set self.mapHeight (* state.map.height state.map.tileheight))
  (set self.halfWWidth (math.floor (/ self.wWidth 2)))
  (set self.halfWHeight (math.floor (/ self.wHeight 2)))
  (set self.thirdWHeight (math.floor (/ (* 2 self.wHeight) 3)))
  (set self.halfPWidth (/ params.playerWidth 2))
  (set self.halfPHeight (/ params.playerHeight 2))
  (self:resetState)
))

; (fn camera.set [self]
;   (love.graphics.push)
;   (love.graphics.translate (- 0 self.x) (- 0 self.y))
; )

; (fn camera.unset [self]
;   (love.graphics.pop)
; )

(fn camera.move [self dx dy]
  (set self.x (+ self.x (or dx 0)))
  (set self.y (+ self.y (or dy 0)))
)

(fn camera.setPosition [self x y]
  (set self.x (or x self.x))
  (set self.y (or y self.y))
)

(fn camera.screenPos [self wx wy]
  (values (* params.scale (- wx self.x)) (* params.scale (- wy self.y)))
)

(fn centerX [self x]
  (if (< x (- self.mapWidth self.halfWWidth self.halfPWidth))
    (math.max 0 (-> x (- self.halfWWidth) (+ self.halfPWidth)))
    (math.min (- x self.halfWWidth) (- self.mapWidth self.wWidth)))
)

(fn centerY [self y]
  (if (< y (- self.mapHeight self.halfWHeight self.halfPHeight))
    (math.max 0 (-> y (- self.halfWHeight) (+ self.halfPHeight)))
    (math.min (- y self.halfWHeight) (- self.mapHeight self.wHeight))
  )
)

(fn centerPlayerX [self] (centerX self state.player.x))
(fn centeryPlayer [self] (centerY self state.player.y))

(fn camera.resetState [self]
  (set self.stateX :lock)
  (set self.versoPrec :r)
  (set self.ox 0)
  (set self.stateY :unlocked)
  (set self.oy 0)
)

(fn camera.unlock [self]
  (set self.stateY :unlocked)
  (set self.oy (math.max 0 (- self.y (centerY self state))))
)

(fn camera.position [self]
  (let [cenX (centerPlayerX self state)
        cenY (centeryPlayer self state)
        yPlayer state.player.y
        newX (match self.stateX
          :lock (do
            (match state.player.verso
              :r (when (= self.versoPrec :l)
                (set self.stateX :range)
                (set self.rangeXL state.player.x)
                (set self.rangeXR (+ state.player.x self.xrange))
              )
              :l (when (= self.versoPrec :r)
                (set self.stateX :range)
                (set self.rangeXL (- state.player.x self.xrange))
                (set self.rangeXR state.player.x)
              )
            )
            cenX
          )
          :range (if (util.between self.rangeXL state.player.x self.rangeXR)
                    self.x
                    (do
                      (set self.stateX :nearing)
                      (set self.ox (- self.x cenX))
                      self.x
                    )
          )
          :nearing (do
            (set self.ox (util.avvicinaAZero self.ox (* state.dt self.speedox)))
            (when (= 0 self.ox) (set self.stateX :lock))
            (+ cenX self.ox)
          ))
        newY (match self.stateY
          :platLock (do
            (set self.oy (util.avvicinaAZero self.oy (* state.dt self.speedoy)))
            (if (< (+ self.y self.thirdWHeight) yPlayer)
                  (do
                    (set self.stateY :unlocked)
                    (set self.oy 0)
                  )
                (and state.player.a-terra? (< self.yrange (math.abs (- yPlayer self.yPlat))))
                  (do
                    (set self.yPlat yPlayer)
                    (set self.oy (math.max 0 (- self.y cenY)))
                  )
            )
            (if (util.between self.halfWHeight (- self.yPlat self.y) self.thirdWHeight)
              self.y
              (centerY self (-> self.yPlat (+ self.oy)))
            )
          )
          :bottomLock (do
            (when (and state.player.a-terra? (< yPlayer (+ self.y self.halfWHeight)))
              (set self.stateY :platLock)
              (set self.yPlat yPlayer)
              (set self.oy (math.max 0 (- self.y cenY)))
            )
            self.y
          )
          :unlocked (do
            (set self.oy (util.avvicinaAZero self.oy (* state.dt self.speedoy)))
            (let [unlY (+ self.oy 
                          (if (util.between self.halfWHeight (- yPlayer self.y) self.thirdWHeight)
                            self.y
                          (< (- yPlayer self.y) self.halfWHeight)
                            cenY
                            (math.max 0 (- yPlayer self.thirdWHeight))))
                  bottomReached? (< self.mapHeight (+ unlY self.wHeight))]
            (if
              bottomReached?
                (do 
                  (set self.stateY :bottomLock)
                  cenY
                )
              state.player.a-terra?
                (do 
                  (set self.stateY :platLock)
                  (set self.yPlat yPlayer)
                  unlY
                )
                unlY
            )
          ))
    )]
    ; (print self.stateY)
    (set self.versoPrec state.player.verso)
    (self:setPosition newX newY)
  )
)

camera
