;;;; This file was automatically generated by /home/bill/programming/cl-glfw/generators/make-bindings-from-spec.lisp

(in-package #:cl-glfw-opengl) 

;;;; intel_parallel_arrays

(defconstant +parallel-arrays-intel+ #x83F4) 
(defconstant +vertex-array-parallel-pointers-intel+ #x83F5) 
(defconstant +normal-array-parallel-pointers-intel+ #x83F6) 
(defconstant +color-array-parallel-pointers-intel+ #x83F7) 
(defconstant +texture-coord-array-parallel-pointers-intel+ #x83F8) 
(defconstant +parallel-arrays-intel+ #x83F4) 
(defconstant +vertex-array-parallel-pointers-intel+ #x83F5) 
(defconstant +normal-array-parallel-pointers-intel+ #x83F6) 
(defconstant +color-array-parallel-pointers-intel+ #x83F7) 
(defconstant +texture-coord-array-parallel-pointers-intel+ #x83F8) 
(defglextfun "TexCoordPointervINTEL" tex-coord-pointerv-intel :return "void"
 :args
 ((:name |size| :type |Int32| :direction :in)
  (:name |type| :type |VertexPointerType| :direction :in)
  (:name |pointer| :type |VoidPointer| :direction :in :array t :size #x4
   :retained t))
 :category "INTEL_parallel_arrays" :deprecated nil :version "1.1") 
(defglextfun "ColorPointervINTEL" color-pointerv-intel :return "void" :args
 ((:name |size| :type |Int32| :direction :in)
  (:name |type| :type |VertexPointerType| :direction :in)
  (:name |pointer| :type |VoidPointer| :direction :in :array t :size #x4
   :retained t))
 :category "INTEL_parallel_arrays" :deprecated nil :version "1.1") 
(defglextfun "NormalPointervINTEL" normal-pointerv-intel :return "void" :args
 ((:name |type| :type |NormalPointerType| :direction :in)
  (:name |pointer| :type |VoidPointer| :direction :in :array t :size #x4
   :retained t))
 :category "INTEL_parallel_arrays" :deprecated nil :version "1.1") 
(defglextfun "VertexPointervINTEL" vertex-pointerv-intel :return "void" :args
 ((:name |size| :type |Int32| :direction :in)
  (:name |type| :type |VertexPointerType| :direction :in)
  (:name |pointer| :type |VoidPointer| :direction :in :array t :size #x4
   :retained t))
 :category "INTEL_parallel_arrays" :deprecated nil :version "1.1") 
(make-extension-loader |INTEL_parallel_arrays|
 (("TexCoordPointervINTEL" tex-coord-pointerv-intel :return "void" :args
   ((:name |size| :type |Int32| :direction :in)
    (:name |type| :type |VertexPointerType| :direction :in)
    (:name |pointer| :type |VoidPointer| :direction :in :array t :size #x4
     :retained t))
   :category "INTEL_parallel_arrays" :deprecated nil :version "1.1")
  ("ColorPointervINTEL" color-pointerv-intel :return "void" :args
   ((:name |size| :type |Int32| :direction :in)
    (:name |type| :type |VertexPointerType| :direction :in)
    (:name |pointer| :type |VoidPointer| :direction :in :array t :size #x4
     :retained t))
   :category "INTEL_parallel_arrays" :deprecated nil :version "1.1")
  ("NormalPointervINTEL" normal-pointerv-intel :return "void" :args
   ((:name |type| :type |NormalPointerType| :direction :in)
    (:name |pointer| :type |VoidPointer| :direction :in :array t :size #x4
     :retained t))
   :category "INTEL_parallel_arrays" :deprecated nil :version "1.1")
  ("VertexPointervINTEL" vertex-pointerv-intel :return "void" :args
   ((:name |size| :type |Int32| :direction :in)
    (:name |type| :type |VertexPointerType| :direction :in)
    (:name |pointer| :type |VoidPointer| :direction :in :array t :size #x4
     :retained t))
   :category "INTEL_parallel_arrays" :deprecated nil :version "1.1"))) 