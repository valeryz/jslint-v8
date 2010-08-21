;; use V8 Javascript to run JSLint for flymake

(require 'flymake)

(defcustom jslint-v8-shell (concat (getenv "HOME")
				   "/.emacs.d/v8/shell")
  "Javascript V8 shell program"
  :type 'string
  :group 'jslint-v8)

(defcustom jslint-v8-location (concat (getenv "HOME")
				   "/.emacs.d/jslint-v8")
  "Location of jslint-v8"
  :type 'string
  :group 'jslint-v8)

(defun flymake-jslint-init ()
  "Initialize flymake for jslint"
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
		     'flymake-create-temp-inplace)))
    (list jslint-v8-shell
      (list "-e" (concat "var input_filename = \"" temp-file "\"")
	    (concat jslint-v8-location "/fulljslint.js")
	    (concat jslint-v8-location "/v8shell.js")))))

(add-to-list 'flymake-allowed-file-name-masks
	     '(".+\\.js$"
	       flymake-jslint-init
	       flymake-simple-cleanup
	       flymake-get-real-file-name))

(add-to-list 'flymake-err-line-patterns
	     '("^Lint at line \\([[:digit:]]+\\) character \\([[:digit:]]+\\): \\(.+\\)$"  
	      nil 1 2 3))

(provide 'flymake-jslint)
