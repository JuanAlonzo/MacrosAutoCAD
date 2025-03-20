; Esta macro permite mover un objeto con el cursor
; Selecciona un objeto y mueve el objeto a la posición del cursor

(defun c:MoverCursor ( / ent ins)
  (setq ent (car (entsel "\nSelecciona el objeto a mover: "))) 
  ; Selecciona el objeto
  (if ent
    (progn
      (setq ins (cdr (assoc 10 (entget ent)))) 
      ; Obtiene el punto de inserción
      (command "_.move" ent "" ins "_.none") 
      ; Mueve el objeto, espera nuevo punto
    )
    (princ "\nNo se selecciono ningun objeto.")
  )
  (princ)
)
