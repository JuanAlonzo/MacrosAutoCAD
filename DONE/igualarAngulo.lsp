;; Usa el comando AA para usar este código
;; AlignAngle(AA)

(defun c:aa ( / entLinea entTexto datosLinea p1 p2 angulo datosTexto ins)
  (setq entLinea (car (entsel "\nSelecciona la linea: ")))
  (setq entTexto (car (entsel "\nSelecciona el texto: ")))
  
  (if (and entLinea entTexto)
    (progn
      ;; Obtener los datos de la línea
      (setq datosLinea (entget entLinea))
      (setq p1 (cdr (assoc 10 datosLinea)))  ;; Punto inicial de la línea
      (setq p2 (cdr (assoc 11 datosLinea)))  ;; Punto final de la línea
      
      ;; Calcular el ángulo de la línea
      (setq angulo (angle p1 p2))
      
      ;; Aplicar el ángulo al texto
      (setq datosTexto (entget entTexto))
      (setq datosTexto (subst (cons 50 angulo) (assoc 50 datosTexto) datosTexto))
      (entmod datosTexto)
      (redraw entTexto 3)

      ;; Obtener el punto de inserción del texto y moverlo con el cursor
      (setq ins (cdr (assoc 10 datosTexto)))
      (command "_.move" entTexto "" ins "_.none")  ;; Mueve el objeto, espera nuevo punto

      (princ "\nTexto alineado con la línea y listo para ubicarlo.")
    )
    (princ "\nError: Debes seleccionar una línea y un texto.")
  )
  (princ)
)
