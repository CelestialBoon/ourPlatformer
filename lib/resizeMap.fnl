(fn range [a b] (var i (- a 1)) (fn ret [] (when (< i b) (set i (+ 1 i)) i)))

(fn decodifica_riga [line]
  (icollect [n (line:gmatch "%d+")]
    (tonumber n)
  )
)

(fn ricopia_tabella [tbl w h]
  (let [oldHeight (length tbl)
        righe []
      ]
    (for [j (- oldHeight h -1) oldHeight]
      (local riga (icollect [i (range 1 w)] (or (-?> tbl (. j) (. i)) 0)))
      (table.insert righe (table.concat riga ","))
    )
    (table.concat righe ",\n")
  )
)

(let [fileName (.. "assets/levels/" (. arg 1) ".tmx")
      ls (icollect [s (io.lines fileName)] s)
      totalLines (length ls)
      newWidth (tonumber (. arg 2))
      newHeight (tonumber (. arg 3))]
  (with-open [f (io.open fileName :w)]
    (fn writeLine [line] (f:write (.. line "\n")))
    (var inTable false)
    (var tbl [])
    (for [nLine 1 totalLines]
      (var line (. ls nLine))
      (let [
        (m1 m2 m3) (line:match "(.* width=\")%d+(.* height=\")%d+(.*)")
        dataLine (line:match "<data")
        tableLine (line:match "^[%d,]+$")
      ]
        (if m1
          (do
            (set line (.. m1 newWidth m2 newHeight m3))
            (writeLine line)
          )
          dataLine ;riga <data>
            (do
              (set inTable true)
              (set tbl [])
              (writeLine line)
            )
          (and inTable tableLine)
            (table.insert tbl (decodifica_riga line))
          (and inTable (not tableLine))
            (do
              (set inTable false)
              (local newTabella (ricopia_tabella tbl newWidth newHeight))
              (writeLine newTabella)
              (writeLine line)
            )
            (writeLine line)
        )
      )
    )
  )
)