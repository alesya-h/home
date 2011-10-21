(ql:quickload "gsll")

;; (defun combinations (n seq)
;;   (if (= n 0)
;;       '( () )
;;       (apply
;;        #'concatenate
;;        (cons 'list
;;              (loop for item in seq
;;                 collect (map 'list
;;                              (lambda (x) (cons item x))
;;                              (combinations (- n 1) seq)))))))

(defmacro logging (message &rest body)
  `(progn
     (format t ,message)
     ,@body
     (format t " done.~%")))

(defun current-thread-name ()
  (bordeaux-threads:thread-name
   (bordeaux-threads:current-thread)))

(defun parallelize (f seq n)
  (let ((len (length seq)))
    (loop for i from 0 below n
       do
         (bordeaux-threads:make-thread
          (lambda ()
            (funcall f
                     (subseq seq
                             (* len (/ i n))
                             (* len (/ (1+ i) n)))))))))

(defun permutations (n)
  (loop with p = (gsll:make-permutation n)
     collect (grid:copy-to p)
     while (nth-value 1 (gsll:permutation-next p))))

(defun encode (word alphabet)
  (map 'vector
       (lambda (letter)
         (elt alphabet letter)) word))

(defvar *alphabet* (concatenate 'list "мицаряту"))
(defvar *library*
  (list "армия" "мицар" "мария" "тарту" "рация" "марта" "марат" "тиара"))
(defvar *sequence*)
(setf *sequence* '(#(#b100 #b100 #b000 #b000 #b010)
                     #(#b100 #b001 #b101 #b000 #b100)
                     #(#b101 #b100 #b101 #b101 #b111)))

(defun humanize (word)
  (map 'vector
       (lambda (n)
         (elt *alphabet* n)) word))

(logging
 "Translating library"
 (defvar *library-translated*
   (map 'list
        (lambda (word)
          (map 'list (lambda (c) (position c *alphabet*)) word))
        *library*)))

(defvar *alphabets* (permutations 8))

(defun bruteforce (alphabets)
  (loop for alphabet in alphabets
     and x = 0 then (1+ x)
     initially (format t "Bruteforce over ~A started.~%" (current-thread-name))
;;     when (= (mod x 1000) 0)
;;       do (format t "~D: Processing alphabet ~S~%" x alphabet)
     do (let ((encoded-words (map 'list
                             (lambda (word) (encode word alphabet))
                             *library-translated*)))
          (loop for first-word in encoded-words
             and w1-pos = 0 then (1+ w1-pos)
             do (let*
                    ((noise (map 'vector #'logxor first-word (elt *sequence* 0)))
                     (w2 (map 'vector #'logxor noise (elt *sequence* 1)))
                     (w3 (map 'vector #'logxor noise (elt *sequence* 2)))
                     (w2-pos (position-if (lambda (w) (equalp w2 w))
                                          encoded-words))
                     (w3-pos (position-if (lambda (w) (equalp w3 w))
                                          encoded-words)))
                  (if (and w2-pos w3-pos)
                      (format t "FOUND: ~A ~{ ~A ~}~%"
                              alphabet
                              (list
                               (humanize (elt *library-translated* w1-pos))
                               (humanize (elt *library-translated* w1-pos))
                               (humanize (elt *library-translated* w1-pos))))))))
     finally (format t "Bruteforce over ~A finished~%" (current-thread-name))))

(parallelize #'bruteforce *alphabets* 4)
