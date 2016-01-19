;;; sly-hello-world.el --- A template SLY contrib  -*- lexical-binding: t; -*-
;;
;; Version: 0.1
;; URL: https://github.com/capitaomorte/sly-hello-world
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
;; `sly-hello-world` is an external contrib for SLY that does nothing
;; special, but acts like a template for writing other external
;; contribs.
;;
;; See README.md
;; 
;;; Code:

(require 'sly)

(define-sly-contrib sly-hello-world
  "Define the `sly-hello-world' contrib.
Depends on the `slynk-hello-world' ASDF system Insinuates itself
in `sly-editing-mode-hook', i.e. lisp files."
  (:slynk-dependencies slynk-hello-world)
  (:on-load (add-hook 'sly-editing-mode-hook 'sly-hello-world-mode))
  (:on-unload (remove-hook 'sly-editing-mode-hook 'sly-hello-world-mode)))

(defvar sly-hello-world--last-reported-feature nil
  "Internal variable for world-helloing purposes")

(defun sly-hello-world ()
  "Interactive command made available in lisp-editing files."
  (interactive)
  (let ((results (sly-eval '(slynk-hello-world:hello-world))))
    (sly-message (cl-first results))
    (setq-local sly-hello-world--last-reported-feature (cl-second results))))

(define-minor-mode sly-hello-world-mode
  "A minor mode active when the contrib is active."
  nil nil nil
  (cond (sly-hello-world-mode
         (add-to-list 'sly-extra-mode-line-constructs
                      'sly-hello-world--mode-line-construct
                      t))
        (t
         (setq sly-extra-mode-line-constructs
               (delq 'sly-hello-world--mode-line-construct
                     sly-extra-mode-line-constructs)))))

(defvar sly-hello-world-map
  "A keymap accompanying `sly-hello-world-mode'."
  (let ((map (make-sparse-keymap)))
    (define-key sly-prefix-map (kbd "C-d C-w") 'sly-hello-world)
    map))

(defun sly-hello-world--mode-line-construct ()
  "A little pretty indicator in the mode-line"
  `(:propertize ,(cond (sly-hello-world--last-reported-feature
                        (symbol-name sly-hello-world--last-reported-feature))
                       (sly-hello-world-mode
                        "hello world")
                       (t
                        "-"))
                face hi-pink
                mouse-face mode-line-highlight
                help-echo ,(if sly-hello-world--last-reported-feature
                               (format "Last reported HELLO-WORLD feature %s"
                                       sly-hello-world--last-reported-feature)
                             "No HELLO-WORLD features reported so far")))

;;; Automatically add ourselves to `sly-contribs' when this file is loaded
;;;###autoload
(add-to-list 'sly-contribs 'sly-hello-world 'append)

(provide 'sly-hello-world)
;;; sly-hello-world.el ends here

