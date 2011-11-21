(defvar *scheme*
  `((f1 not x3)
    (f2 or x5 x6)
    (f3 and x1 x2)
    (f4 and x4 f2 x7)
    (f5 and f1 f4)
    (f6 or f3 f5)))

(defparameter +selected+ 'f3)

(defun get-singular-cube (row)
  (caadr row

(defmacro fn (&rest args)
  `(lambda ,@args))

(defun get-deps (elem)
  (cdadr elem))

(defun make-d-cubes (a b)
  (cond
    ((and (eq a  0) (eq b  0))   0)
    ((and (eq a  0) (eq b :x))   0)
    ((and (eq a :x) (eq b  0))   0)
    ((and (eq a :x) (eq b :x))  :x)
    ((and (eq a  1) (eq b  1))   1)
    ((and (eq a  1) (eq b :x))   1)
    ((and (eq a :x) (eq b  1))   1)
    ((and (eq a  1) (eq b  0))  :d)
    ((and (eq a  0) (eq b  1)) :^d)
    (t (error "wrong input"))))

(defun intersect-d-cubes (a b)
  (let ((rez (mapcar (fn (ai bi)
              (cond
                ((eq ai bi) ai)
                ((eq ai :x) bi)
                ((eq bi :x) ai)
                (t nil)))
          a b)))
    (if (position nil rez)
        nil
        rez)))
