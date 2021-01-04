{
  :pathPunteggi "save/hiScore.txt"
  :listaLivelli [:level1 :level2]
  :scale 3

  :playerWidth 10
  :playerHeight 16
  :playerX 3
  :playerY 0
  :weaponDuration .4

  :playerInvinc 1.5
  :enemyInvinc 1

  :accel 1.8
  :attrito 6
  :v-salto-terra 200
  :v-salto-muro-v 150
  :v-salto-muro-h 150
  :v-salto-doppio 150
  :v-bumper 300
  :gravita 400
  :v-idle 2
  :speeds {:bat 30 :slime 30 :ghost 20 :spider 45}
  :hp {:player 3 :bat 2 :slime 2 :ghost 2 :spider 2}
  :tiles {:objective {:tx 13 :ty 3} :heart {:tx 15 :ty 0} :gem {:tx 14 :ty 0} :uiheart {:tx 12 :ty 9} :explosion {:tx 12 :ty 10 :flen 5 :tick [.05 .10 .15 .20 .25] :scale 3}}
}