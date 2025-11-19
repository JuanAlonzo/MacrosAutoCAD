;; Esta macro permite eliminar todos los objetos de una capa seleccionada dentro de un límite de selección.

(defun c:BORRARCAPA ()
  (vl-load-com)

  ;; Seleccionar objetos dentro de un límite
  (setq selSet (ssget))
  (if selSet
    (progn
      ;; Obtener todas las capas dentro de la selección
      (setq layersList '())  ;; Lista para almacenar capas únicas
      (setq i 0)
      (while (< i (sslength selSet))
        (setq ent (ssname selSet i))
        (setq entData (entget ent))
        (setq entLayer (cdr (assoc 8 entData)))
        (if (not (member entLayer layersList))
          (setq layersList (cons entLayer layersList))
        )
        (setq i (1+ i))
      )

      ;; Mostrar las capas encontradas
      (princ "\nCapas encontradas en la seleccion:")
      (setq index 1)
      (foreach layer layersList
        (princ (strcat "\n[" (itoa index) "] " layer))
        (setq index (1+ index))
      )

      ;; Pedir al usuario que seleccione un número
      (setq choice (getint "\nElige el numero de la capa a eliminar: "))
      (if (and choice (<= choice (length layersList)) (> choice 0))
        (progn
          (setq selectedLayer (nth (1- choice) layersList))  ;; Obtener la capa seleccionada
          (princ (strcat "\nEliminando elementos en la capa: " selectedLayer))

          ;; Eliminar los objetos en la capa seleccionada dentro del set
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
        (princ "\nSeleccion invalida.")
      )
    )
    (princ "\nNo se seleccionaron elementos.")
  )
  (princ)
)
