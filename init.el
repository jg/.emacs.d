(defun load-conf (filename)
  "load the file in ~/.emacs.d/ unless it has already been loaded"
  (defvar *loaded-files* '())
  (if (not (memq filename *loaded-files*))
      (progn
	(load-file (expand-file-name (concat "~/.emacs.d/" filename ".el")))
	(add-to-list '*loaded-files* filename))))

; config
(setq scroll-step 1)
(setq auto-window-vscroll nil)
(tool-bar-mode -1)
(setq backup-directory-alist `(("." . "~/.saves")))
(setq undo-limit 3600)

(add-to-list 'load-path "~/.emacs.d/vendor")

(load-conf "find-file-in-project")
(load-conf "scala-mode")
(load-conf "evil")
; (load-conf "undo-tree")

; kbd shortcuts
(load-conf "keybindings")