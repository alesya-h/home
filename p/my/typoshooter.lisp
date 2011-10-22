(ql:quickload "lispbuilder-sdl")
(ql:quickload "lispbuilder-sdl-examples")

;; (let ((connection
;;        (or swank::*emacs-connection* (swank::default-connection))))
;;   (when (and connection (not (eql swank:*communication-style* :spawn)))
;;     (swank::handle-requests connection t)))


(defparameter *random-color* sdl:*white*)

(defun draw-enemy (x y caption)
  (sdl:draw-surface-at-* (sdl:load-image "~/p/my/enemy.png") x y)
  )

(defun mouse-rect-2d ()
  (sdl:with-init ()
    (sdl:window 320 240 :title-caption "Move a rectangle using the mouse")
    (setf (sdl:frame-rate) 60)

    (sdl:with-events ()
      (:quit-event () t)

      (:key-down-event (:key key)
                       (when (sdl:key= key :sdl-key-escape)  
                         (sdl:push-quit-event)))
      (:idle ()
       ;; Change the color of the box if the left mouse button is depressed
       (when (sdl:mouse-left-p)
         (setf *random-color* (sdl:color :r (random 255) :g (random 255) :b (random 255))))
       ;; Clear the display each game loop
       (sdl:clear-display sdl:*black*)

       ;; Draw the box having a center at the mouse x/y coordinates.
       (draw-enemy  (sdl:mouse-x) (sdl:mouse-y) nil)
;;       (sdl:draw-box (sdl:rectangle-from-midpoint-* (sdl:mouse-x) (sdl:mouse-y) 20 20)
;;                     :color *random-color*)

       ;; Redraw the display
       (sdl:update-display)))))
(mouse-rect-2d)
