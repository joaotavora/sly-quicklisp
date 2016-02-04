;;; -*- lisp -*-
(in-package :asdf)

(defsystem :slynk-quicklisp
    :author "João Távora <https://github.com/capitaomorte>"
    :depends-on (#:slynk)
  :description "HELLO-WORLD support for Slynk"
  :components ((:file "slynk-quicklisp")))

;; Local Variables:
;; coding: utf-8
;; End:
