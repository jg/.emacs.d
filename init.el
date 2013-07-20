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
(load-conf "windata") ; for dirtree

(load-conf "evil")

; language modes
(load-conf "ruby-mode")
(load-conf "rspec-mode")
(load-conf "ruby-end")
(load-conf "inf-ruby")
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
(load-conf "find-file-in-project")
(load-conf "dirtree")
(load-conf "ensime")

(load-conf "keybindings")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(background-color "#fdf6e3")
 '(background-mode light)
 '(cursor-color "#657b83")
 '(custom-enabled-themes nil)
 '(custom-safe-themes (quote ("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(foreground-color "#657b83"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
