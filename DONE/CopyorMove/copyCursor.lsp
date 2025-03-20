; Esta MACRO permite copiar un objeto con el cursor y pegarlo en la posición del cursor

(defun c:CopiarCursor ( / ent ins)
  (setq ent (car (entsel "\nSelecciona el objeto a copiar: "))) 
  ; Selecciona el objeto
  (if ent
    (progn
      (setq ins (cdr (assoc 10 (entget ent)))) 
      ; Obtiene el punto de inserción
      (command "_.copybase" ins ent "" "_.pasteclip") 
      ; Copia con referencia y pega con cursor
    )
    (princ "\nNo se selecciono ningún objeto.")
  )
  (princ)
)
