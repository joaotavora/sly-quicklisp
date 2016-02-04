;;; sly-quicklisp.el --- A template SLY contrib  -*- lexical-binding: t; -*-
;;
;; Version: 0.1
;; URL: https://github.com/capitaomorte/sly-quicklisp
;; Keywords: languages, lisp, sly
;; Package-Requires: ((sly "1.0.0-beta2"))
;; Author: João Távora <joaotavora@gmail.com>
;; 
;; Copyright (C) 2015 João Távora
;;
;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;
;;; Commentary:
;; 
;; `sly-quicklisp` is an external contrib for SLY that does nothing
;; special, but acts like a template for writing other external
;; contribs.
;;
;; See README.md
;; 
;;; Code:

(require 'sly)

(define-sly-contrib sly-quicklisp
  "Define the `sly-quicklisp' contrib.
Depends on the `slynk-quicklisp' ASDF system Insinuates itself
in `sly-editing-mode-hook', i.e. lisp files."
  (:slynk-dependencies slynk-quicklisp)
  (:on-load (add-hook 'sly-editing-mode-hook 'sly-quicklisp-mode))
  (:on-unload (remove-hook 'sly-editing-mode-hook 'sly-quicklisp-mode)))

(defvar sly-quicklisp--last-reported-feature nil
  "Internal variable for world-helloing purposes")

(defun sly-quicklisp ()
  "Interactive command made available in lisp-editing files."
  (interactive)
  (let ((results (sly-eval '(slynk-quicklisp:quicklisp))))
    (sly-message (cl-first results))
    (setq-local sly-quicklisp--last-reported-feature (cl-second results))))

(define-minor-mode sly-quicklisp-mode
  "A minor mode active when the contrib is active."
  nil nil nil
  (cond (sly-quicklisp-mode
         (add-to-list 'sly-extra-mode-line-constructs
                      'sly-quicklisp--mode-line-construct
                      t))
        (t
         (setq sly-extra-mode-line-constructs
               (delq 'sly-quicklisp--mode-line-construct
                     sly-extra-mode-line-constructs)))))

(defvar sly-quicklisp-map
  "A keymap accompanying `sly-quicklisp-mode'."
  (let ((map (make-sparse-keymap)))
    (define-key sly-prefix-map (kbd "C-d C-w") 'sly-quicklisp)
    map))

(defun sly-quicklisp--mode-line-construct ()
  "A little pretty indicator in the mode-line"
  `(:propertize ,(cond (sly-quicklisp--last-reported-feature
                        (symbol-name sly-quicklisp--last-reported-feature))
                       (sly-quicklisp-mode
                        "hello world")
                       (t
                        "-"))
                face hi-pink
                mouse-face mode-line-highlight
                help-echo ,(if sly-quicklisp--last-reported-feature
                               (format "Last reported HELLO-WORLD feature %s"
                                       sly-quicklisp--last-reported-feature)
                             "No HELLO-WORLD features reported so far")))

;;; Automatically add ourselves to `sly-contribs' when this file is loaded
;;;###autoload
(add-to-list 'sly-contribs 'sly-quicklisp 'append)

(provide 'sly-quicklisp)
;;; sly-quicklisp.el ends here

