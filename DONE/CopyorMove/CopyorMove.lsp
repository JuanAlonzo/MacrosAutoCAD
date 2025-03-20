(defun c:CopyOrMove ( / ent ins opcion)
  (setq opcion (getstring "\n¿Quieres Mover(1) o Copiar(2)? [M/C]: ")) 
  ; Preguntar opción

  (if (member opcion '("1" "m" "2" "c"))
    (progn
      (setq ent (car (entsel "\nSelecciona el objeto: "))) 
      ; Seleccionar objeto
      (if ent
        (progn
          (setq ins (cdr (assoc 10 (entget ent)))) 
          ; Obtener punto de inserción

          (cond
            ((or (= opcion "2") (= opcion "c"))
             (command "_.copybase" ins ent "" "_.pasteclip") 
             ; Copiar con referencia
            )

            ((or (= opcion "1") (= opcion "m"))
             (command "_.move" ent "" ins "_.none") 
             ; Mover con referencia
            )
          )
        )
        (princ "\nNo se selecciono ningun objeto.")
        ; Validacion de error
      )
    )
    (princ "\nOpcion no valida, usa 1 o 2.")
    ; Validacion de error
  )
  (princ)
)
