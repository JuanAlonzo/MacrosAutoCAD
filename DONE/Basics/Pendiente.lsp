(Defun c:pnd()
	; Inicializamos las variables de sistema "cmdecho" y "entl".
	(setq cmd (getvar "cmdecho"))
	(setvar "cmdecho" 0)

	(if (setq entl (ENTSEL "\nSeleccione la linea a calcular la pendiente: "))
		(progn
			(setq nenl (car entl))
			(setq base (entget nenl))
			
			(setq TipoEntidad (CDR (ASSOC 0 base)))
			
			(if (= TipoEntidad "LINE")
				(progn
					(setq p1(cdr (assoc ' 10 base))) ;Punto inicial
					(setq p2(cdr (assoc ' 11 base))) ;Punto final
					
					(setq X1 (car p1))
					(setq X2 (car p2))
					
					;Para evitar que se rote totalmente el texto seleccionado
					(if (< X1 X2)
						(setq ang (angle p1 p2))
						(setq ang (angle p2 p1))
					)
					
					(setq Y1 (cadr p1)) 
					(setq Y2 (cadr p2))
					 
					; Ejecutamos operaciones para hallar la pendiente.
					(setq RestaX1X2 (- X1 X2)) ; Aqu� restamos el x1 menos el x2
					(setq RestaY1Y2 (- Y1 Y2)) ; Aqu� restamos el y1 menos el y2
					(setq Pendiente (/ RestaY1Y2 RestaX1X2)) ; A las distancias obtenidas, las restamos y hallamos la pendiente.
					(setq PendientePorc (* Pendiente 100)) ; Multiplicamos la pendiente por 100 para obtener el porcentaje.
					(if (setq ent (ENTSEL "\nSeleccione el texto a actualizar con la pendiente <Mostrar>: "))
						(progn
							(setq cienv (strcat "S=" (rtos PendientePorc 2 2)  "%"))
							
							(setq nent (car ent))
							(setq base (entget nent))
							           
							(setq base (subst (cons 1 cienv) (assoc 1 base) base))
							;; Cambiamos el contenido del texto (c�digo 1).
							(setq base (subst (cons 50 ang) (assoc 50 base) base))
							;Cambiamos el �ngulo del texto (c�digo 50).
							
							;Finalmente actualizamos la base de datos de la entidad en la pantalla (actualizaci�n del texto).
							(entmod base)
						)
						(progn
							(setq prinl (strcat "\nPendiente: " (rtos PendientePorc 2 3)  "% ; "))
							(setq prin2 (strcat prinl "Longitud: " (rtos (distance p1 p2) 2 3) "m, " ))
							(setq prin3 (strcat prin2 "L. Hor.: " (rtos RestaX1X2 2 3) "m, " ))
							(setq prin4 (strcat prin3 "Angulo: "  (angtos (angle p1 p2) 1 2)))
							
							; Finalmente mostramos un mensaje con los valores obtenidos del procesamiento.
							(princ prin4)
						)
					)
				)
			)
		)
	)
	          
	(setvar "cmdecho" cmd)
	(setvar "modemacro" "http://www.mariotorres.pe/")
	(princ)
)