[![MELPA](http://melpa.org/packages/sly-hello-world-badge.svg)](http://melpa.org/#/sly-hello-world)

# HELLO-WORLD support for SLY

`sly-hello-world` is an external contrib for [SLY][sly] that does
nothing special, but acts like a template for writing other external contribs.

## Install from MELPA

Perform the [usual MELPA setup](http://melpa.org) 
and then do `M-x package-install RET sly-hello-world RET`.

`M-x sly` should now bring up a hello-world enabled SLY.

(for the first time only, you'll have to `M-x sly-setup` before to 
correctly setup contribs)

## Melpa-less install

Since this is an external contrib with both Elisp and Lisp parts,
merely loading the Elisp will have little effect. The contrib has to
be registered in SLY's `sly-contribs` variable for SLY to take care of
loading the Lisp side on demand.

For convenience, the `sly-hello-world-autoloads` file takes care
of this automatically. So the following setup in your `~/.emacs` or
`~/.emacs.d/init/el` init file should be enough.

```elisp
;;; regular SLY setup
(setq inferior-lisp-program "/path/to/your/preferred/lisp")
(add-to-list 'load-path "/path/to/sly")
(require 'sly-autoloads)

(add-to-list 'load-path "/path/to/sly-hello-world")
(require 'sly-hello-world-autoloads)
```

In case you already have SLY loaded and running, you might have to
`M-x sly-setup` and `M-x sly-enable-contrib` to enable it.

`sly-hello-world` should now kick in in Lisp buffers.

[sly]: https://github.com/capitaomorte/sly





