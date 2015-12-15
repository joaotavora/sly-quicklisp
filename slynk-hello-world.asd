;;; -*- lisp -*-
(in-package :asdf)

(defsystem :slynk-hello-world
    :author "João Távora <https://github.com/capitaomorte>"
    :depends-on (#:slynk)
  :description "HELLO-WORLD support for Slynk"
  :components ((:file "slynk-hello-world")))

;; Local Variables:
;; coding: utf-8
;; End:
