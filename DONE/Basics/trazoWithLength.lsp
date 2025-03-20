(defun c:trazo ()
  ;aqui se esta colocando otro defun como subfuncion 
  ;es necesario llamarma por su codigo (grados) para que esta ejecute
  ;esta no sera leida por si sola ya que el programa la reconoce como funcion
  (defun grados (rg)
    (* (/ rg pi) 180.0)
    )

  ;(setq) se encarga de almacenar las variables colocadas. 
  ;(getpoint) se encarga de colocar los puntos de las variables en la pantalla de autocad
  (setq p1 (getpoint "\npunto 1"))
  (setq p2 (getpoint "\npunto 2" p1))

  ;el comando (distance) se encarga de medir la distancia de la linea
  (setq dista (distance p1 p2))

  ;el comando (angle) se encarga de medir el angulo de inclinacion de la linea 
  (setq rg (angle p1 p2))

  ;el comandon "_line" se encargar de trasar lineas atraves de las variables establecidas
  (command "_line" p1 p2 "")

  ;en el comando se pueden aprecian 2 funciones "_text" y "_m2p"
  ;el comaddo "_text" establece un text en la pantalla de autocad
  ;el comando "_m2p"(middle two points)(en medio de los puntos) se encargar de colocar el texto entre las variables establecidas
  (command "_text" "_m2p" p1 p2 "" (grados rg) dista)






  )