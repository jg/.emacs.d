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

; dependencies
; (load-conf "windata") ; for dirtree

(load-conf "evil")

; language modes
(load-conf "typescript-mode")
(load-conf "haskell-mode")
(load-conf "javascript-mode")
(load-conf "markdown-mode")
(load-conf "scala-mode2")
(load-conf "sh-mode")
(load-conf "html")
(load-conf "c-mode")
(load-conf "r-mode")
(load-conf "auctex")
(load-conf "ess")

; ruby modes
(load-conf "rspec-mode")
(load-conf "ruby-mode")
(load-conf "ruby-end")
(load-conf "inf-ruby")

; editing
(load-conf "move-text")
; (load-conf "smart-parens")

; dired
(load-conf "dired")

; other
(load-conf "ace-jump-mode")
(load-conf "ag")
; (load-conf "org-babel")
(load-conf "whitespace-mode")
(load-conf "org-mode")
(load-conf "git-blame")
(load-conf "yasnippet")
(load-conf "deft")
(load-conf "ido")
(load-conf "term")
(load-conf "speedbar")
(load-conf "flycheck")
; (load-conf "themes")
(load-conf "auto-indent-mode")
(load-conf "find-file-in-project")
(load-conf "dirtree")
(load-conf "ensime")
(load-conf "fiplr")
(load-conf "bookmark+")
(load-conf "magit")
(load-conf "projectile")
(load-conf "ibuffer")
(load-conf "fill-column-indicator")
(load-conf "exec-path-from-shell")
; custom commands
(load-conf "insert-link-with-html-title")

(setq org-latex-pdf-process (quote ("texi2dvi --pdf --clean --verbose
--batch %f" "bibtex %b" "texi2dvi --pdf --clean --verbose --batch %f"
"texi2dvi --pdf --clean --verbose --batch %f")))

(load-conf "keybindings")

