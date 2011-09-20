;;;; This file was automatically generated by /home/bill/programming/cl-glfw/generators/make-bindings-from-spec.lisp

(in-package #:cl-glfw-opengl) 

;;;; sgis_texture_filter4

(defglextfun "TexFilterFuncSGIS" tex-filter-func-sgis :return "void" :args
 ((:name |target| :type |TextureTarget| :direction :in)
  (:name |filter| :type |TextureFilterSGIS| :direction :in)
  (:name |n| :type |SizeI| :direction :in)
  (:name |weights| :type |Float32| :direction :in :array t :size n))
 :category "SGIS_texture_filter4" :deprecated nil :version "1.0") 
(defglextfun "GetTexFilterFuncSGIS" get-tex-filter-func-sgis :return "void"
 :args
 ((:name |target| :type |TextureTarget| :direction :in)
  (:name |filter| :type |TextureFilterSGIS| :direction :in)
  (:name |weights| :type |Float32| :direction :out :array t :size
   (|target| |filter|)))
 :category "SGIS_texture_filter4" :deprecated nil :version "1.0") 
(make-extension-loader |SGIS_texture_filter4|
 (("TexFilterFuncSGIS" tex-filter-func-sgis :return "void" :args
   ((:name |target| :type |TextureTarget| :direction :in)
    (:name |filter| :type |TextureFilterSGIS| :direction :in)
    (:name |n| :type |SizeI| :direction :in)
    (:name |weights| :type |Float32| :direction :in :array t :size n))
   :category "SGIS_texture_filter4" :deprecated nil :version "1.0")
  ("GetTexFilterFuncSGIS" get-tex-filter-func-sgis :return "void" :args
   ((:name |target| :type |TextureTarget| :direction :in)
    (:name |filter| :type |TextureFilterSGIS| :direction :in)
    (:name |weights| :type |Float32| :direction :out :array t :size
     (|target| |filter|)))
   :category "SGIS_texture_filter4" :deprecated nil :version "1.0"))) 