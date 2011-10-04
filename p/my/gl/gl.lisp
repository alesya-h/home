(ql:quickload (list "cl-opengl" "cl-glu" "cl-glut"))

(defclass my-window (glut:window)
  ()
  (:default-initargs :title "gl-test"))

