(defun c:ml()
  (setq p1 (getpoint "\nIndica punto de origen:"))
  (while
    (setq p2 (getpoint "\nIndica un lugar:" p1))
    (command "_line" p1 p2 "")
  )
  (princ)
)


