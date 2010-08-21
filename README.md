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

2. Build V8 with the _shell sample_.

    See [Google's instructions](http://code.google.com/intl/ru/apis/v8/build.html).
    In short:
    
        cd ~/.emacs.d
        svn checkout http://v8.googlecode.com/svn/trunk/ v8
        cd v8
        scons sample=shell
    On my Mac OS 10.5, there are harmless warnings which nevertheless don't let V8 build, because Google uses `-Werror`. If this happens, edit the `SConstruct` file and remove the `-Werror` flag, then run scons.

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
