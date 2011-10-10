(ql:quickload "gsll")

(defun combinations (n seq)
  (if (= n 0)
      '( () )
      (apply #'concatenate
             (cons 'list
                   (loop for item in seq
                      collect (map 'list
                                   (lambda (x) (cons item x))
                                   (combinations (- n 1) seq)))))))

(defun permutations (n)
  (loop with p = (gsll:make-permutation n)
     collect (grid:copy-to p)
     while (nth-value 1 (gsll:permutation-next p))))

(defmacro logging (message &rest body)
  `(progn
     (format t ,message)
     ,@body
     (format t " done.~%")))

(defun encode (word alphabet)
  (map 'vector
       (lambda (letter)
         (elt alphabet letter)) word))

(defun humanize (word)
  (map 'vector
       (lambda (n)
         (elt *alphabet* n)) word))

(defvar *alphabet* (concatenate 'list "аимртуця"))
(defvar *library*
  (list "армия" "мицар" "мария" "тарту" "рация" "марта" "марат" "тиара"))
(defvar *sequence* '(#(#b000 #b101 #b101 #b001 #b101)
                     #(#b010 #b110 #b010 #b011 #b001)
                     #(#b001 #b000 #b000 #b100 #b001)))
;; (setf *sequence* '(#(4 2 3 1 5)
;;                    #(3 1 0 4 2)
;;                    #(3 4 2 1 5)))

(setf *sequence* '(#(6 1 7 0 5)
                   #(1 2 4 5 2)
                   #(1 7 6 0 5)))


(logging
 "Translating library"
 (defvar *library-translated*
   (map 'list
        (lambda (word)
          (map 'list (lambda (c) (position c *alphabet*)) word))
        *library*)))

(logging
  "Generating alphabets"
 (defvar *alphabets* (permutations 8))
 (defvar *alphabets-1* (subseq *alphabets* 0 (* (length *ALPHABETS*) 1/4)))
 (defvar *alphabets-2* (subseq *alphabets*
                               (* (length *ALPHABETS*) 1/4)
                               (* (length *ALPHABETS*) 2/4)))
 (defvar *alphabets-3* (subseq *alphabets*
                               (* (length *ALPHABETS*) 2/4)
                               (* (length *ALPHABETS*) 3/4)))
 (defvar *alphabets-4* (subseq *alphabets*
                               (* (length *ALPHABETS*) 3/4))))

(logging
 "Generating word combinations"
 (defvar *word-combinations*
   (combinations 3 *library-translated*)))

(defun current-thread-name ()
  (bordeaux-threads:thread-name (bordeaux-threads:current-thread)))

(defun bruteforce (alphabets)
  (loop for alphabet in alphabets
     and x = 0 then (1+ x)
     initially (format t "Bruteforce over ~A started.~%" (current-thread-name))
     when (= (mod x 1000) 0)
       do (format t "~D: Processing alphabet ~S~%" x alphabet)
     do (dolist (word-combination *word-combinations*)
          (let* ((words (map 'list
                             (lambda (word) (encode word alphabet))
                             word-combination))
                 (xors (map 'list
                            (lambda (seq1 seq2)
                              (map 'vector #'logxor seq1 seq2))
                            words
                            *sequence*)))
            (if (and (equalp (elt xors 0) (elt xors 1))
                     (equalp (elt xors 0) (elt xors 2)))
                (progn
                  (format t "~%FFFOUND!!!! ~A ~{ ~A ~}~%~%"
                          alphabet
                          (map 'list
                               #'humanize
                               word-combination))
                  (bordeaux-threads:make-thread
                   (lambda ()
                     (run-program "/usr/bin/mplayer"
                                  '("/home/alesguzik/music/04grazing.mp3"))))
                  (return)))))
     finally (format t "Bruteforce over ~A finished~%" (current-thread-name))))

(bordeaux-threads:make-thread
 (lambda ()
   (bruteforce *alphabets-1*))
 :name "first part")
(bordeaux-threads:make-thread
 (lambda ()
   (bruteforce *alphabets-2*))
 :name "second part")
(bordeaux-threads:make-thread
 (lambda ()
   (bruteforce *alphabets-3*))
 :name "third part")
(bordeaux-threads:make-thread
 (lambda ()
   (bruteforce *alphabets-4*))
 :name "fourth part")
