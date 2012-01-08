;; (ql:quickload "bordeaux-threads")

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

(defun all-permutations (list)
  (cond ((null list) nil)
        ((null (cdr list)) (list list))
        (t (loop for element in list
             append (mapcar (lambda (l) (cons element l))
                            (all-permutations (remove element list)))))))

(defun permutations (n)
  (all-permutations
   (loop for i from 0 below n collect i)))

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
(setf *sequence* '(#(#b111 #b101 #b101 #b001 #b101)
                   #(#b010 #b110 #b010 #b011 #b001)
                   #(#b101 #b010 #b010 #b011 #b000)))

(setf *sequence* (reverse (mapcar #'reverse *sequence*)))

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
                               (humanize (elt *library-translated* w2-pos))
                               (humanize (elt *library-translated* w3-pos))))))))
     finally (format t "Bruteforce over ~A finished~%" (current-thread-name))))

;; (parallelize #'bruteforce *alphabets* 4)
(bruteforce *alphabets*)
