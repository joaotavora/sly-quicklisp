[![MELPA](http://melpa.org/packages/sly-quicklisp-badge.svg)](http://melpa.org/#/sly-quicklisp)
[![Build Status](https://travis-ci.org/capitaomorte/sly-quicklisp.svg?branch=master)](https://travis-ci.org/capitaomorte/sly-quicklisp)

# Use this to write a [SLY][sly] contrib

`sly-quicklisp` is an external contrib for [SLY][sly] that does
nothing useful in itself, but acts is a template for writing other
external contribs.

This example makes it easy to setup a SLY extension that:

* is completely self-contained (doesn't need to be bundled with SLY)

* has both Emacs-Lisp and Common-Lisp counterparts

  See `sly-quicklisp.el` and `slynk-quicklisp.lisp`

* has automated [Travis tests](https://travis-ci.org/capitaomorte/sly-quicklisp) already in place

  See the file `.travis.yml`. There are some sample unit tests for
  this contrib using SBCL and CCL there.

* is easily added to [MELPA](http://melpa.org)

  Just ask make a
  [pull request to MELPA](https://github.com/milkypostman/melpa/pulls)
  and ask for your recipe to be added to `recipes/`. Use this template:

```lisp
(sly-quicklisp :fetcher github
                         :repo "capitaomorte/sly-quicklisp"
                         :files (:defaults
                                 "*.lisp"
                                 "*.asd"))
```


The remainder of this `README.md` file is itself a template for the
one that should be included in a contrib.

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





