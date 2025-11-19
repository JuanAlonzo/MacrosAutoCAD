(defun c:EscalarBloque (/ blk1 blk2 ent1 ent2 datos1 datos2 size1 size2 scale basePoint)
  (setq blk1 (entsel "\nSelecciona el bloque que quieres escalar: "))  
  (if blk1
      (progn
        (setq ent1 (car blk1)
              datos1 (entget ent1)
              size1 (cdr (assoc 41 datos1)))  ; Obtiene la escala X actual

        (setq blk2 (entsel "\nSelecciona el bloque de referencia: "))  
        (if blk2
            (progn
              (setq ent2 (car blk2)
                    datos2 (entget ent2)
                    size2 (cdr (assoc 41 datos2)))  ; Obtiene la escala X del bloque referencia

              (if (and size1 size2 (/= size1 0))
                  (progn
                    (setq scale (/ size2 size1))  ; Calcula la nueva escala
                    (setq basePoint (getpoint "\nSelecciona el punto base para la escala: "))
                    (command "_.scale" ent1 "" basePoint scale)  ; Aplica la escala con punto base
                    (princ "\nBloque escalado correctamente.")
                  )
                  (princ "\nError: No se pudo calcular la escala.")
              )
            )
            (princ "\nError: No seleccionaste un bloque de referencia.")
        )
      )
      (princ "\nError: No seleccionaste un bloque válido.")
  )
  (princ)
)