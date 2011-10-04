(ql:quickload (list "cl-opengl" "cl-glu" "cl-glut"))


(defmethod glut:reshape ((w my-window) width height)
  (gl:viewport 0 0 width height)
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (glu:perspective 40 (/ width height) 1 20)
  (gl:matrix-mode :modelview)
  (gl:load-identity))

(defmethod glut:keyboard ((w my-window) key x y)
  (declare (ignore x y))
  (case key
    (#\Space (glut:post-redisplay))
    (#\Esc (glut:destroy-current-window))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass my-window (glut:window)
  (
   (balls :initform '())
   )
  (:default-initargs :width 500 :height 500 :pos-x 100 :pos-y 100
                     :title "BSUIR: OPENGL-2D"
                     :mode '(:single :rgb :depth)))


(defvar *balls* nil)
(defvar *w*)
(defvar *h*)

(defun make-ball (&key (x (/ *h* 2)) (y (/ *w* 2)) (radius 0.2) (alpha (random PI)) (v 100) (a 0))
  (list x y radius alpha v a))

(defun add-ball ()
  (push (make-ball) *balls*))

(defmethod glut:display-window ((w my-window))
  (gl:clear-color 0 0 0 0)
  (gl:shade-model :smooth)
  (setq *balls* nil)
  (push (make-ball) *balls*))

(defmacro with-ball (ball)
  (let 
  

(defun draw-ball (ball)
  (with-ball (ball)
  (gl:with-pushed-matrix
    (gl:translate x y 0)
    (glu:look-at 0 0 5 0 0 0 0 1 0)
    (gl:color 1 0 0)
    (glut:solid-sphere 0.10 100 10)))

(defmethod glut:display ((w my-window))
  (gl:clear :color-buffer :depth-buffer)
  (mapcar #'draw-ball *balls*)
  (gl:flush))

(defmethod glut:idle ((w my-window))
  
  )

(glut:display-window (make-instance 'my-window))