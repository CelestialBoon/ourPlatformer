(var camera {:x 0 :y 0 :ox 0 :oy 0 :versoPrec :r :stateX :lock :stateY 0 :rangeXL 0 :rangeXR 0})
(util.merge camera params.camera)

(fn camera.initialize [self state]
  (let [(wWidth wHeight) (love.graphics.getDimensions)
        scaledWidth (/ wWidth params.scale)
        scaledHeight (/ wHeight params.scale)]
  (set self.wWidth scaledWidth)
  (set self.wHeight scaledHeight)
  (set self.mapWidth (* state.map.width state.map.tilewidth))
  (set self.mapHeight (* state.map.height state.map.tileheight))
  (set self.halfWWidth (math.floor (/ self.wWidth 2)))
  (set self.halfWHeight (math.floor (/ self.wHeight 2)))
  (set self.thirdWHeight (math.floor (/ self.wHeight 3)))
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

(fn centerX [self state]
  (if (< state.player.x (- self.mapWidth self.halfWWidth))
    (math.max 0 (- state.player.x self.halfWWidth))
    (math.min (- state.player.x self.halfWWidth) (- self.mapWidth self.wWidth)))
)

(fn centerY [self state]
  (if (< state.player.y (- self.mapHeight self.halfWHeight))
    (math.max 0 (- state.player.y self.halfWHeight))
    (math.min (- state.player.y self.halfWHeight) (- self.mapHeight self.wHeight)))
)

(fn camera.position [self state]
  (let [cenX (fn [] (centerX self state))
        cenY (fn [] (centerY self state))
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
            (cenX)
          )
          :range (if (util.between self.rangeXL state.player.x self.rangeXR)
                    self.x
                    (do
                      (set self.stateX :nearing)
                      (set self.ox (- self.x (cenX)))
                      self.x
                    )
          )
          :nearing (do
            (set self.ox (util.avvicinaAZero self.ox (* state.dt self.speedox)))
            (when (= 0 self.ox) (set self.stateX :lock))
            (+ (cenX) self.ox)
          ))
        newY (cenY)]
    (print self.stateX)
    (set self.versoPrec state.player.verso)
    (self:setPosition newX newY)
  )
)

camera
