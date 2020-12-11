{ :sleep (fn sleep [s]
  (let [ntime (+ (os.clock) (/ s 10))]
    (while true
      (when (> (os.clock) ntime)
        (lua "break")))))

 :equals (fn equals [a bs]
  (var result false)
  (each [_ v (ipairs bs)]
    (when (= a v) (set result true)))
  result)

  :merge (fn merge [t1 t2]
    (each [k v (pairs t2)]
      (tset t1 k v)
    )
  )
}


