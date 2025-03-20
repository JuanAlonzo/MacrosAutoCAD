;;Macro para dibujar un grid
;;Maximo de 100 x 100

(defun c:gridSize ()
  (setq intervalo 10)
  (setq x_min 0)
  (setq x_max 100)
  (setq y_min 0)
  (setq y_max 100)
  (progn
    (loop
      (setq x x_min)
      (while (<= x x_max)
        (command "line" (list x y_min) (list x y_max))
        (setq x (+ x intervalo))
      )
    )
    (loop
      (setq y y_min)
      (while (<= y y_max)
        (command "line" (list x_min y) (list x_max y))
        (setq y (+ y intervalo))
      )
    )
  )
)
