(require :asdf)
(asdf:load-system "lispbuilder-sdl")
(asdf:load-system "lispbuilder-sdl-examples")

;; (let ((connection
;;        (or swank::*emacs-connection* (swank::default-connection))))
;;   (when (and connection (not (eql swank:*communication-style* :spawn)))
;;     (swank::handle-requests connection t)))


(defparameter *random-color* sdl:*white*)
(defparameter *screen-width* 640)
(defparameter *screen-height* 480)
(defvar *enemies* '())

(defclass sprite ()
  ((x :reader get-x :initarg :x)
   (y :reader get-y :initarg :y)
   (frames :initarg :frames)))

(defmethod 

(defclass movable (sprite)
  ((speed :reader get-speed :initarg :speed)))


(defclass enemy (movable)
  ((word :reader get-word :initarg :word))
  

(defmethod draw ((enemy enemy))
  (sdl:draw-surface-at-*
   (sdl:load-image "~/p/my/enemy.png" :color-key-at (sdl:point))
   x
   y))

(defun draw-player (angle text)
  (sdl:draw-surface-at-* (sdl:load-image "~/p/my/enemy.png")
                         (/ *screen-width* 2)
                         (/ *screen-height* 2)))

(defun game-main ()
  (sdl:with-init ()
    (sdl:window *screen-width* *screen-height*
                :title-caption "Move a rectangle using the mouse")
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
       (sdl:clear-display sdl:*white*)

       ;; Draw the box having a center at the mouse x/y coordinates.
       (draw-player 45 "test")
       (dolist (enemy *enemies*)
         (draw enemy))
       (draw-enemy  (sdl:mouse-x) (sdl:mouse-y) nil)
;;       (sdl:draw-box (sdl:rectangle-from-midpoint-* (sdl:mouse-x) (sdl:mouse-y) 20 20)
;;                     :color *random-color*)

       ;; Redraw the display
       (sdl:update-display)))))
(game-main)
