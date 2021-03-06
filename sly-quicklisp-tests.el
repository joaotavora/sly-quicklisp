(require 'sly)
(require 'sly-quicklisp)
(require 'sly-tests "lib/sly-tests")
(require 'cl-lib)

(define-sly-ert-test sly-quicklisp-basic-test ()
  (with-temp-buffer
    (lisp-mode)
    (should sly-quicklisp-mode)
    (should-not sly-quicklisp--enabled-dists)
    (sly-quickload "sequence-iterators")
    (sly-sync-to-top-level 5)
    (should sly-quicklisp--enabled-dists)
    (should (listp sly-quicklisp--enabled-dists))
    (should (cl-every #'stringp sly-quicklisp--enabled-dists))))
