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
(load-conf "ruby-end")
(load-conf "markdown-mode")
(load-conf "scala-mode2")

; editing
(load-conf "move-text")
(load-conf "org-mode")

;; ; dired
(load-conf "dired")

;; ; other
(load-conf "yasnippet")
(load-conf "deft")
(load-conf "ido")
(load-conf "term")
(load-conf "speedbar")
(load-conf "flycheck")
(load-conf "themes")
(load-conf "auto-indent-mode")
;; (load-conf "ensime")

(load-conf "keybindings")

