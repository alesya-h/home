;;;; This file was automatically generated by /home/bill/programming/cl-glfw/generators/make-bindings-from-spec.lisp

(in-package #:cl-glfw-opengl) 

;;;; ati_envmap_bumpmap

(defconstant +bump-rot-matrix-ati+ #x8775) 
(defconstant +bump-rot-matrix-size-ati+ #x8776) 
(defconstant +bump-num-tex-units-ati+ #x8777) 
(defconstant +bump-tex-units-ati+ #x8778) 
(defconstant +dudv-ati+ #x8779) 
(defconstant +du8dv8-ati+ #x877A) 
(defconstant +bump-envmap-ati+ #x877B) 
(defconstant +bump-target-ati+ #x877C) 
(defconstant +bump-rot-matrix-ati+ #x8775) 
(defconstant +bump-rot-matrix-size-ati+ #x8776) 
(defconstant +bump-num-tex-units-ati+ #x8777) 
(defconstant +bump-tex-units-ati+ #x8778) 
(defconstant +dudv-ati+ #x8779) 
(defconstant +du8dv8-ati+ #x877A) 
(defconstant +bump-envmap-ati+ #x877B) 
(defconstant +bump-target-ati+ #x877C) 
(defglextfun "GetTexBumpParameterfvATI" get-tex-bump-parameter-fv-ati :return
 "void" :args
 ((:name |pname| :type |GetTexBumpParameterATI| :direction :in)
  (:name |param| :type |Float32| :direction :out :array t :size (|pname|)))
 :category "ATI_envmap_bumpmap" :deprecated nil :version "1.2") 
(defglextfun "GetTexBumpParameterivATI" get-tex-bump-parameter-iv-ati :return
 "void" :args
 ((:name |pname| :type |GetTexBumpParameterATI| :direction :in)
  (:name |param| :type |Int32| :direction :out :array t :size (|pname|)))
 :category "ATI_envmap_bumpmap" :deprecated nil :version "1.2") 
(defglextfun "TexBumpParameterfvATI" tex-bump-parameter-fv-ati :return "void"
 :args
 ((:name |pname| :type |TexBumpParameterATI| :direction :in)
  (:name |param| :type |Float32| :direction :in :array t :size (|pname|)))
 :category "ATI_envmap_bumpmap" :deprecated nil :version "1.2") 
(defglextfun "TexBumpParameterivATI" tex-bump-parameter-iv-ati :return "void"
 :args
 ((:name |pname| :type |TexBumpParameterATI| :direction :in)
  (:name |param| :type |Int32| :direction :in :array t :size (|pname|)))
 :category "ATI_envmap_bumpmap" :deprecated nil :version "1.2") 
(make-extension-loader |ATI_envmap_bumpmap|
 (("GetTexBumpParameterfvATI" get-tex-bump-parameter-fv-ati :return "void"
   :args
   ((:name |pname| :type |GetTexBumpParameterATI| :direction :in)
    (:name |param| :type |Float32| :direction :out :array t :size (|pname|)))
   :category "ATI_envmap_bumpmap" :deprecated nil :version "1.2")
  ("GetTexBumpParameterivATI" get-tex-bump-parameter-iv-ati :return "void"
   :args
   ((:name |pname| :type |GetTexBumpParameterATI| :direction :in)
    (:name |param| :type |Int32| :direction :out :array t :size (|pname|)))
   :category "ATI_envmap_bumpmap" :deprecated nil :version "1.2")
  ("TexBumpParameterfvATI" tex-bump-parameter-fv-ati :return "void" :args
   ((:name |pname| :type |TexBumpParameterATI| :direction :in)
    (:name |param| :type |Float32| :direction :in :array t :size (|pname|)))
   :category "ATI_envmap_bumpmap" :deprecated nil :version "1.2")
  ("TexBumpParameterivATI" tex-bump-parameter-iv-ati :return "void" :args
   ((:name |pname| :type |TexBumpParameterATI| :direction :in)
    (:name |param| :type |Int32| :direction :in :array t :size (|pname|)))
   :category "ATI_envmap_bumpmap" :deprecated nil :version "1.2"))) 