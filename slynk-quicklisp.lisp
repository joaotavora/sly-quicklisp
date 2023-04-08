(defpackage #:slynk-quicklisp
  (:use :cl #:slynk-api)
  (:export
   #:quickload
   #:available-system-names))
(in-package #:slynk-quicklisp)

(defslyfun quickload (system-name)
  "Basically the same as QL:QUICKLOAD"
  (ql:quickload system-name)
  (mapcar #'ql-dist:version (ql-dist:enabled-dists)))

(defun get-ql-local-project-names ()
  (apply #'append
         (cl:mapcar
          (lambda (path)
            (with-open-file (in (merge-pathnames path "system-index.txt"))
              (when in
                  (loop for line = (read-line in nil nil) while line
                        collect (pathname-name (pathname line))))))
          ql:*local-project-directories*)))

(defslyfun available-system-names ()
  (append (cl:mapcar 'ql-dist:name (ql:system-list))
          (get-ql-local-project-names)))

(provide 'slynk-quicklisp)
