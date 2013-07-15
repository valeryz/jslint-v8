JSLint for Emacs Flymake using V8
=================================

This allows to use JSLint from Emacs using Javascript V8.  There are
other ways to use JSLint from Emacs, see
[Emacs Wiki](http://www.emacswiki.org/emacs/FlymakeJavaScript), but this one
attempts to be the easiest and the fastest.

Installation
------------

Assuming you install your emacs packages in `~/.emacs.d`:

1. Put this package in `~/.emacs.d/jslint-v8`.

2. Install V8 with the _shell sample_.

   On OS X:
	    brew install v8

3. Configure Emacs:

    Put the following lines in your `.emacs`:

        (add-to-list 'load-path "~/.emacs.d/jslint-v8")
        (require 'flymake-jslint)
        (add-hook 'javascript-mode-hook
                  (lambda () (flymake-mode t)))

Customization
-------------

If your V8 or emacs packages locations are different, you may need to customize the variables
`jslint-v8-shell` and `jslint-v8-location`.
