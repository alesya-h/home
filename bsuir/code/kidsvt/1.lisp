(defvar *scheme*
  `((f1 (not x3))
    (f2 (or x5 x6))
    (f3 (and x1 x2))
    (f4 (and x4 f2 x7))
    (f5 (and f1 f4))
    (f6 (or f3 f5))))

(defun try-scheme (scheme out &optional
                   (x1 nil)
                   (x2 nil)
                   (x3 nil)
                   (x4 nil)
                   (x5 nil)
                   (x6 nil)
                   (x7 nil)
                   (x8 nil))
  (eval `(let ((x1 ,x1)
               (x2 ,x2)
               (x3 ,x3)
               (x4 ,x4)
               (x5 ,x5)
               (x6 ,x6)
               (x7 ,x7)
               (x8 ,x8))
           (let* ,scheme
             ,out
             ))))

(defmacro use-scheme (sch 
  `(let ((x1 ,x1)
         (x2 ,x2)
         (x3 ,x3)
         (x4 ,x4)
         (x5 ,x5)
         (x6 ,x6)
         (x7 ,x7)
         (x8 ,x8))
     (,sch)))
