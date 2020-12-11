(fn icollect [iter-tbl value-expr]
              `(let [tbl# []]
                (each ,iter-tbl
                  (tset tbl# (+ (length tbl#) 1) ,value-expr))
                tbl#))

{ : icollect 
}