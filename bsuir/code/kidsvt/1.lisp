(defmacro fn (&rest args)
  `(lambda ,@args))

(defun filter (fn 1st)
  (let ((ace nil))
    (dolist (x 1st)
      (let ((val (funcall fn x)))
        (if val (push x ace))))
    (nreverse ace)))

(defparameter *scheme*
  (list '(:x1 :x2 :x3 :x4 :x5 :x6)
    '(:f1 (not x3)
      :f2 (or x5 x6)
      :f3 (and x1 x2)
      :f4 (and x4 f2 x7)
      :f5 (and f1 f4)
      :f6 (or f3 f5))
    '(:f6)))

(defun get-names (scheme)
  (concatenate 'list
               (car scheme) 
               (filter #'symbolp (get-defs scheme))))

(defun get-defs (scheme)
  (cadr scheme))
(defun get-outs (scheme)
  (caddr scheme))

(defun make-singular-cube (elt scheme)
  )

(defun refrences? (who whom scheme)
  (if (position who (getf (get-defs scheme) whom) t nil)))

(defun elements-just-after (points scheme)
  (let (all (get-defs scheme)
  (loop for i in point
             do (progn
                  (
(defparameter +selected+ 'f3)

;(defun get-singular-cube (row)
;  (caadr row

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
