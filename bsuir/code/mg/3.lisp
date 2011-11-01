(require :asdf)
(asdf:load-system :cl-opengl)
(asdf:load-system :cl-glu)
(asdf:load-system :cl-glut)
(asdf:load-system :lispbuilder-sdl-image)

(defclass my-window (glut:window)
  ()
  (:default-initargs :width 250 :height 250 :title "lab 3"
                     :mode '(:single :rgb :depth)))

(defvar *angle* 0)
(defvar *window*)

(defun on-timer ()
  (setf *angle* (mod (+ *angle* 1) (* 2 180)))
  (glut:with-window *window*
    (glut:post-redisplay))
  (glut:schedule-timer 10 #'on-timer))

(defun load-a-texture (filename)
  (let ((texture (car (gl:gen-textures 1)))
        (image (sdl-image:load-image filename)))
    (gl:bind-texture :texture-2d texture)
    (gl:tex-parameter :texture-2d :texture-min-filter :linear)

    (sdl-base::with-pixel (pix (sdl:fp image))
      ;; we should probably be a bit more intelligent about this, but this
      ;; handles some common cases
      (let ((texture-format (ecase (sdl-base::pixel-bpp pix)
                              (3 :rgb)
                              (4 :rgba))))
        ;; we should also handle this properly, by adjusting the
        ;; settings of gl:pixel-store
        (assert (and (= (sdl-base::pixel-pitch pix)
                        (* (sdl:width image) (sdl-base::pixel-bpp pix)))
                     (zerop (rem (sdl-base::pixel-pitch pix) 4))))
        (gl:tex-image-2d :texture-2d 0 :rgba
                         (sdl:width image) (sdl:height image)
                         0
                         texture-format
                         :unsigned-byte (sdl-base::pixel-data pix))))
    texture))

(defmethod glut:display-window :before ((w my-window))
  (gl:clear-color 0 0 0 0)
  (gl:cull-face :back)
  (gl:depth-func :less)
  (gl:disable :dither)
  (gl:shade-model :smooth)
  (gl:hint :perspective-correction-hint :nicest)
  (gl:light-model :light-model-local-viewer 1)
  (gl:color-material :front :ambient-and-diffuse)
  (gl:enable :light0 :lighting :cull-face :depth-test)
  (glut:schedule-timer 0 #'on-timer))

(sdl:init-sdl)

(setf *the-texture* (load-a-texture "/home/alesguzik/lisplogo_fancy_256.png"))
(setf cl-opengl-bindings:*gl-get-proc-address* #'sdl-cffi::sdl-gl-get-proc-address)

(defmethod glut:display ((window my-window))
  (gl:load-identity)
  (gl:translate 0 0 -5)
  (gl:rotate 30 1 1 0)
  (gl:light :light0 :position '(0 1 1 0))
  (gl:light :light0 :diffuse '(0.8 0.4 0.6 0))
  (gl:clear :color-buffer :depth-buffer)
  (gl:enable :texture-2d)
  (gl:bind-texture :texture-2d *the-texture*))
  (gl:color 1 1 1)
  (gl:front-face :cw)
  (gl:with-pushed-matrix
    (gl:rotate *angle* 0 1 0)
    (glut:solid-teapot 1.3)
    )
  (gl:front-face :ccw)
  (gl:flush))

(defmethod glut:reshape ((window my-window) width height)
  (gl:viewport 0 0 width height)
  (gl:matrix-mode :projection)
  (gl:load-identity)
  (glu:perspective 50 (/ width height) 0.5 20)
  (gl:matrix-mode :modelview)
  (gl:load-identity))

(defmethod glut:keyboard ((window my-window) key x y)
  (declare (ignore x y))
  (when (eql key #\Esc)
    (glut:destroy-current-window)))

(defun start ()
  (setf *window* (make-instance 'my-window))
  (glut:display-window *window*))
;(start)
