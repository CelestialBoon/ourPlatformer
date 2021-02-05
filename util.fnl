(fn sleep [s]
  (let [ntime (+ (os.clock) (/ s 10))]
    (while true
      (when (> (os.clock) ntime)
        (lua "break")))))

(fn between [a b c]
  (and (<= a b) (<= b c))
)

(fn avvicinaAZero [n distance]
  (if (= 0 n) 0
    (< 0 n) (if (<= n distance) 0
        (- n distance))
    (let [negdist (- 0 distance)]
      (if (<= negdist n) 0
        (- n negdist)
      )
    )
  )
)

(fn equals [a bs]
  (var result false)
  (each [_ v (ipairs bs)]
    (when (= a v) (set result true)))
  result)

(fn merge [t1 t2]
  (each [k v (pairs t2)]
    (tset t1 k v)
  )
)

(fn average [ns]
  (var tot 0)
  (each [_ n (ipairs ns)]
    (set tot (+ tot n))
  )
  (/ tot (length ns))
)

(fn atTimeExec [state time f]
  (var t 0)
  (table.insert state.routines (fn routine []
    (if (< t time)
      (do
        (set t (+ t state.dt))
        routine)
      (do
        (f)
        nil ) ) )) )

{: sleep : between : avvicinaAZero : equals : merge : average : atTimeExec}
