; Usa MLSum para usar esta MACRO

(defun c:MLSum ()
  (setq ss (ssget '((0 . "TEXT,MTEXT"))))
  
  (if ss
    (progn
      (setq p_centro (getpoint "\nIndica el punto central:"))
      (setq oper 0 text-found nil)
      (setq i 0)
      
      (while (< i (sslength ss))
        (setq ent (ssname ss i))
        (setq entData (entget ent))
        (setq p1 (cdr (assoc 10 entData)))
        
        ;; Obtiene el valor del texto y lo suma
        (setq AAA (cdr (assoc 1 entData)))
        (setq AREAE (atof AAA))
        (setq oper (+ AREAE oper))
        (setq text-found t)
        
        ;; Dibujar línea desde el texto hasta el punto central
        (command "_line" p1 p_centro "")
        
        (setq i (1+ i))
      )
      
      ;; Insertar la suma al lado del punto de inserción
      (if text-found
        (progn
          (setq ptEtiqueta (list (+ (car p_centro) 2.0) (cadr p_centro) (caddr p_centro)))
          (setq color (if (and (>= oper 16) (<= oper 18)) 3 1)) ; 3 = Verde, 1 = Rojo
          (setq textEnt (entmakex (list (cons 0 "TEXT")
                                        (cons 10 ptEtiqueta)
                                        (cons 40 1.5) ; Altura del texto
                                        (cons 1 (rtos oper 2 2)) ; Contenido del texto
                                        (cons 50 0.0) ; Rotación
                                        (cons 62 color) ; Color asignado directamente
                                  )))
        )
        (alert "No se encontraron textos válidos para sumar."))
    )
    (princ "\nNo se seleccionaron textos."))
  
  (princ))
