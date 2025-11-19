(defun c:NumerarObjetos (/ objs num puntoBase ordenados obj datos txt)
  (setq objs (ssget '((0 . "TEXT,MTEXT,INSERT"))))  ; Selecciona textos y bloques
  (if objs
      (progn
        (setq num (getint "\nIngrese el número de inicio: "))
        (setq puntoBase (getpoint "\nSeleccione el punto base: "))
        ;; Ordenar por cercanía al punto base
        (setq ordenados
              (vl-sort
                (mapcar 'cadr (ssnamex objs))
                (function
                  (lambda (a b)
                    (< (distance puntoBase (cdr (assoc 10 (entget a))))
                       (distance puntoBase (cdr (assoc 10 (entget b))))))
                )
              )
        )
        ;; Asignar números secuenciales
        (foreach obj ordenados
          (setq datos (entget obj))
          (cond
            ((= (cdr (assoc 0 datos)) "TEXT")  ; Si es texto
             (setq datos (subst (cons 1 (itoa num)) (assoc 1 datos) datos))
             (entmod datos))
            ((= (cdr (assoc 0 datos)) "MTEXT")  ; Si es multitexto
             (setq datos (subst (cons 1 (itoa num)) (assoc 1 datos) datos))
             (entmod datos))
            ((= (cdr (assoc 0 datos)) "INSERT")  ; Si es bloque
             (setq txt (vlax-invoke (vlax-ename->vla-object obj) 'getattributes))
             (foreach att txt
               (if (vlax-property-available-p att 'textstring)
                 (vlax-put att 'textstring (itoa num))))
            )
          )
          (setq num (1+ num))  ; Incrementa el número
        )
        (princ "\nNumeración completada.")
      )
      (princ "\nNo se seleccionaron objetos válidos.")
  )
  (princ)
)
