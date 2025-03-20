;; Crea un circulo basico en AutoCAD

(defun c:crear_circulo () 
  (setq centro (getpoint "Selecciona el centro del circulo: "))
  (setq radio (getreal "Introduce el radio: "))
  (command "CIRCLE" centro radio)
)