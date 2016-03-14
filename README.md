[![MELPA](http://melpa.org/packages/sly-quicklisp-badge.svg)](http://melpa.org/#/sly-quicklisp)
[![Build Status](https://travis-ci.org/capitaomorte/sly-quicklisp.svg?branch=master)](https://travis-ci.org/capitaomorte/sly-quicklisp)

# Basic QUICKLISP support for SLY

`sly-quicklisp` is an external contrib for [SLY][sly] that provides a
`sly-quickload` command `C-c C-d C-q` that prompts the user for a
package to install.

![screenshot](screenshot.png)

The latest quicklisp dist is shown in the mode-line.

## Install from MELPA

Perform the [usual MELPA setup](http://melpa.org) and then select
`sly-quicklisp` for installation from the package menu or from `M-x
package-install`.

Once it's done, `M-x sly` should now bring up a quicklisp enabled
SLY.

In `.lisp` files you can now use `M-x sly-quicklisp` to be informed
about the quicklispness of your Lisp.

## Melpa-less install

Since this is an external contrib with both Elisp and Lisp parts,
merely loading the Elisp will have little effect. The contrib has to
be registered in SLY's `sly-contribs` variable for SLY to take care of
loading the Lisp side on demand.

For convenience, the `sly-quicklisp-autoloads` file takes care
of this automatically. So the following setup in your `~/.emacs` or
`~/.emacs.d/init/el` init file should be enough:

```elisp
;;; regular SLY setup
(setq inferior-lisp-program "/path/to/your/preferred/lisp")
(add-to-list 'load-path "/path/to/sly")
(require 'sly-autoloads)

(add-to-list 'load-path "/path/to/sly-quicklisp")
(require 'sly-quicklisp-autoloads)
```

In case you already have SLY loaded and running, you might have to
`M-x sly-setup` and `M-x sly-enable-contrib` to enable it.

`sly-quicklisp` should now kick in in Lisp buffers.

[sly]: https://github.com/capitaomorte/sly





