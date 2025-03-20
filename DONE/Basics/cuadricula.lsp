;;Setea las variables x e y en 0

(defun c:cuadricula () 
  (setq x 0)
  (setq y 0)
  (repeat 10 
    (command "LINE" (list x 0) (list x 100) "")
    (command "LINE" (list 0 y) (list 100 y) "")
    (setq x (+ x 10))
    (setq y (+ y 10))
  )
)