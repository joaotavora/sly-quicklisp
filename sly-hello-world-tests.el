(require 'sly)
(require 'sly-hello-world)
(require 'sly-tests "lib/sly-tests")

(define-sly-ert-test sly-hello-world-basic-test ()
  (with-temp-buffer
    (lisp-mode)
    (should sly-hello-world-mode)
    (should-not sly-hello-world--last-reported-feature)
    (sly-hello-world)
    (should sly-hello-world--last-reported-feature)
    (should (keywordp sly-hello-world--last-reported-feature))))
