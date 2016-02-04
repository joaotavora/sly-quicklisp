(require 'sly)
(require 'sly-quicklisp)
(require 'sly-tests "lib/sly-tests")

(define-sly-ert-test sly-quicklisp-basic-test ()
  (with-temp-buffer
    (lisp-mode)
    (should sly-quicklisp-mode)
    (should-not sly-quicklisp--last-reported-feature)
    (sly-quicklisp)
    (should sly-quicklisp--last-reported-feature)
    (should (keywordp sly-quicklisp--last-reported-feature))))
