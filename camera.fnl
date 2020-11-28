(var camera {:x 0 :y 0})

(fn camera.set [self]
  (love.graphics.push)
  (love.graphics.translate (- 0 self.x) (- 0 self.y))
)

(fn camera.unset [self]
  (love.graphics.pop)
)

(fn camera.move [self dx dy]
  (set self.x (+ self.x (or dx 0)))
  (set self.y (+ self.y (or dy 0)))
)

(fn camera.setPosition [self x y]
  (set self.x (or x self.x))
  (set self.y (or y self.y))
)

camera
