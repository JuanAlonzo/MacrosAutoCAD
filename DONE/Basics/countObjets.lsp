(defun c:contar_objetos () 
  (setq capa (getstring "\nIntroduce el nombre de la capa: "))
  (setq ss (ssget "X" (list (cons 8 capa))))

  (if ss 
    (princ (strcat "\nNumero de objetos en " capa ": " (itoa (sslength ss))))
    (princ "\nNo se encontraron objetos en la capa.")
  )
  (princ)
)
