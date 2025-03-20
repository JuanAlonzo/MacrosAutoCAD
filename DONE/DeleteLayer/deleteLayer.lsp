;; Esta funcion permite borrar solo un bloque sobre un espacio determinado
;; PASOS:
;; Seleccionar objetos dentro de un límite
;; Pedir al usuario escribir el nombre de la capa
;; Eliminar los objetos en la capa seleccionada dentro del set

(defun c:deleteLayer ()
  (vl-load-com)

  ;; Seleccionar objetos dentro de un límite
  (setq selSet (ssget))
  (if selSet
    (progn
      ;; Obtener lista de capas presentes en la selección
      (setq capas '())
      (setq i 0)
      (while (< i (sslength selSet))
        (setq ent (ssname selSet i))
        (setq entData (entget ent))
        (setq entLayer (cdr (assoc 8 entData)))
        (if (not (member entLayer capas))
          (setq capas (cons entLayer capas))
        )
        (setq i (1+ i))
      )

      ;; Si hay capas en la selección, mostrar opciones
      (if capas
        (progn
          ;; Mostrar lista de capas y pedir entrada
          (princ "\nCapas disponibles en la seleccion:")
          (mapcar '(lambda (cap) (princ (strcat "\n - " cap))) capas)
          (princ "\nIngrese el nombre de la capa a eliminar: ")
          (setq selectedLayer (getstring))

          ;; Si la capa ingresada es válida, proceder con la eliminación
          (if (member selectedLayer capas)
            (progn
              (setq i 0)
              (while (< i (sslength selSet))
                (setq ent (ssname selSet i))
                (setq entData (entget ent))
                (setq entLayer (cdr (assoc 8 entData)))
                (if (= entLayer selectedLayer)
                  (entdel ent))
                (setq i (1+ i))
              )
              (princ (strcat "\nElementos en la capa '" selectedLayer "' eliminados."))
            )
            (princ "\nLa capa ingresada no esta en la selección.")
          )
        )
        (princ "\nNo hay capas en la seleccion.")
      )
    )
    (princ "\nNo se seleccionaron elementos.")
  )
  (princ)
)
