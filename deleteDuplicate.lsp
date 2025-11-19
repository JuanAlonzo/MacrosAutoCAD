(defun c:EliminarDuplicados (/ ss lista ent datos)
  (setq ss (ssget '((0 . "LINE,TEXT,MTEXT,INSERT"))))  
  ; Selecciona líneas, textos y bloques
  (if ss
      (progn
        (setq lista '()) 
        (repeat (sslength ss)
          (setq ent (ssname ss 0))
          (setq datos (entget ent))
          (if (not (member datos lista))
              (setq lista (cons datos lista))
              (progn
                (entdel ent)  ; Elimina duplicados
                (princ "\nElemento duplicado eliminado.")
              )
          )
          (ssdel ent ss)
        )
      )
      (princ "\nNo hay elementos duplicados.")
  )
  (princ)
)
