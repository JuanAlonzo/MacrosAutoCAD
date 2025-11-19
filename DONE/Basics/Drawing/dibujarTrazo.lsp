(defun c:dibujarTrazo ()

   (defun grados (rg)
    (* (/ rg pi) 180.0)
   )
  (setq alt-text (getreal "\nIntroduce la altura del texto: " ))
  (setq num-dec (getint "\nNumero de decimales: "))
  (setq p1 (getpoint "\nEstablecer punto 1: "))
  (setq p2 (getpoint "\nEstablecer punto 2: " p1))
  (setq dista (distance p1 p2))
  (setq dista (rtos dista 2 num-dec))
  (setq rg (angle p1 p2))
  (command "_line" p1 p2 "")
  (command "_text" "_c""_m2p" p1 p2 alt-text (grados rg) dista)


)