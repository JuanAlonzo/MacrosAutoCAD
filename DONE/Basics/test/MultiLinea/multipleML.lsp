;; MultiML crea lineas desde varios puntos a uno central
;; Bastante util a la hora de usar la capa de alimentado

(defun c:multiml()
  (setq ss (ssget '((0 . "TEXT,MTEXT"))))

  (if ss
    (progn
      (setq p_centro (getpoint "\nIndica el punto central:"))

      (setq i 0)
      (while (< i (sslength ss))
        (setq ent (ssname ss i))
        (setq entData (entget ent))
        (setq p1 (cdr (assoc 10 entData)))

        (command "_line" p1 p_centro "")

        (setq i (1+ i))
      )
    )
    (princ "\nNo se seleccionaron textos.")
  )

  (princ)
)
