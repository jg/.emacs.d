(defun load-conf (filename)
  "load the file in ~/.emacs.d/ unless it has already been loaded"
  (defvar *loaded-files* '())
  (if (not (memq filename *loaded-files*))
      (progn
	(load-file (expand-file-name (concat "~/.emacs.d/" filename ".el")))
	(add-to-list '*loaded-files* filename))))

(add-to-list 'load-path "~/.emacs.d/vendor")

(load-conf "settings")
(load-conf "packages")

(load-conf "evil")

; language modes
(load-conf "ruby-mode")
(load-conf "ruby-electric")
(load-conf "ruby-end")
(load-conf "markdown-mode")

; editing
(load-conf "move-text")
(load-conf "keybindings")
(load-conf "org-mode")

; other
(load-conf "yasnippet")
(load-conf "deft")
(load-conf "ido")
