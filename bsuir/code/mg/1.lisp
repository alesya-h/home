(ql:quickload "clx")

(defpackage #:lab-1
  (:use :cl :asdf))

(in-package :lab-1)

(defmacro add-to-list (list new-head)
          `(setq ,list (cons ,new-head ,list)))

(defun make-circle (x0 y0 radius)
  (let ((points '())
        (x 0)
        (y radius)
        (delta (- 2 (* 2 radius)))
        (err 0))
    (loop while (>= y 0)
       do (tagbody
            (add-to-list points (list (+ x0 x) (+ y0 y)))
            (add-to-list points (list (+ x0 x) (+ y0 y)))
            (add-to-list points (list (+ x0 x) (+ y0 y)))
            (add-to-list points (list (+ x0 x) (+ y0 y)))
            (setq err (- (* 2 (+ delta y)) 1))
            (if (and (< delta 0)
                     (<= err 0))
                (progn
                  (setq x (1+ x))
                  (setq delta (+ delta (* 2 x) 1))
                  (go end-label)))
            (setq err (- (* 2 (- delta x)) 1))
            (if (and (> delta 0)
                     (> err 0))
                (progn
                  (setq y (1- y))
                  (setq delta (+ delta (- 1 (* 2 y))))
                  (go end-label)))
             (setq x (1+ x))
             (setq delta (+ delta (* 2 (- x y))))
             (setq y (1- y))
             end-label))
    points))

(defun make-line (x1 y1 x2 y2)
  (let* ((points '())
        (delta-x (abs (- x2 x1)))
        (delta-y (abs (- y2 y1)))
        (sign-x (if (< x1 x2) 1 -1))
        (sign-y (if (< y1 y2) 1 -1))
        (err (- delta-x delta-y)))
    (loop
       do (progn
            (setq points (cons (list x1 y1) points))
            (if (and (= x1 x2) (= y1 y2))
                (return points))
            (setq err2 (* err 2))
            (if (> err2 (- delta-y))
                (progn
                  (setq err (- err delta-y))
                  (setq x1 (+ x1 sign-x))))
            (if (< err2 delta-x)
                (progn
                  (setq err (+ err delta-x))
                  (setq y1 (+ y1 sign-y))))))))

(setq *dots* (append (make-line 10 10 100 30)
                     (make-line 300 30 40 17)
                     (make-circle 0 0 300)
                     (make-line 43 14 300 400)))

(defun display ()
  (let* ((display (xlib:open-display ""))
         (screen (first (xlib:display-roots display)))
         (black (xlib:screen-black-pixel screen))
         (white (xlib:screen-white-pixel screen))
         (root-window (xlib:screen-root screen))
         (gc (xlib:create-gcontext
                   :drawable root-window
                   :foreground black
                   :background white))
         (window (xlib:create-window
                     :parent root-window
                     :x 0
                     :y 0
                     :width 400
                     :height 300
                     :background white
                     :event-mask (xlib:make-event-mask :exposure
                                                       :button-press))))
    (describe gc)
    (xlib:map-window window)
    (xlib:event-case (display :force-output-p t
                              :discard-p t)
      (:exposure ()
                 (loop for point in *dots* with last = nil
                    do (setq last
                             (xlib:draw-point window gc
                                              (car point)
                                              (cadr point)))
                    finally (return last)))
      (:button-press () t))
    (xlib:destroy-window window)
    (xlib:close-display display)))

(display)
