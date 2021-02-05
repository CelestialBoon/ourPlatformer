(fn icollect2 [iter-tbl value-expr] `(let [tbl# []] (each ,iter-tbl (tset tbl# (+ (length tbl#) 1) ,value-expr)) tbl#))
(fn fold [[name init] iter-tbl fold-expr] `(do (var ,name ,init) (each ,iter-tbl (set ,name ,fold-expr)) ,name))
(fn add [a n] `(set ,a (+ ,a ,n)))

{ : icollect2 
  : fold
  : add
}