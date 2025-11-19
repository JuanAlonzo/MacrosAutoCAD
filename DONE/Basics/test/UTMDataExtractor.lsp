(defun c:exportar_utm () 
  (setq capa "NUMERACION DE POSTES EJECUTADOS")
  ; Cambiar por el nombre de la capa si no es la correcta

  (setq archivo_nombre (getfiled "Guardar coordenadas UTM" 
                                 "coordenadas_utm.csv"
                                 "csv"
                                 1
                       )
  )
  ;; NOTA: Para abrir correctamente en Excel, sigue estos pasos:
  ;; Si los datos aparecen en una sola columna, usa "Datos" > "Texto en columnas" en Excel
  ;;    y selecciona "Delimitado por tabulación".

  (if archivo_nombre 
    (progn 
      (setq archivo (open archivo_nombre "w"))
      (if archivo 
        (progn 
          (write-line "Numero, X, Y" archivo)

          (setq ss (ssget "X" (list (cons 8 capa)))) ; Selecciona objetos de la capa
          (if ss 
            (progn 
              (setq i 0)
              (while (< i (sslength ss)) 
                (setq entidad (ssname ss i))
                (setq datos (entget entidad)) ; Obtiene la información de la entidad
                (setq punto (cdr (assoc 10 datos))) ; Obtiene las coordenadas X, Y

                ;; Obtener el número del poste desde los atributos del bloque
                (setq numero "")
                (setq entidad_atributo (entnext entidad))
                (while 
                  (and entidad_atributo 
                       (/= (cdr (assoc 0 (entget entidad_atributo))) "SEQEND")
                  )
                  (if (= (cdr (assoc 0 (entget entidad_atributo))) "ATTRIB") 
                    (setq numero (cdr (assoc 1 (entget entidad_atributo))))
                  )
                  (setq entidad_atributo (entnext entidad_atributo))
                )

                (if (and punto numero) 
                  (progn 
                    (setq x (car punto))
                    (setq y (cadr punto))

                    ;; Guarda en el archivo en formato CSV
                    (write-line (strcat numero "," (rtos x 2 3) "," (rtos y 2 3)) 
                                archivo
                    )
                  )
                )
                (setq i (+ i 1))
              )
              (princ (strcat "\nCoordenadas exportadas a: " archivo_nombre))
            )
            (princ "\nNo se encontraron objetos en la capa.")
          )
          (close archivo)
        )
        (princ "\nError: No se pudo abrir el archivo para escritura.")
      )
    )
    (princ "\nExportacion cancelada por el usuario.")
  )
  (princ)
)

