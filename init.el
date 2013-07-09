(defun load-conf (filename)
  "load the file in ~/.emacs.d/ unless it has already been loaded"
  (defvar *loaded-files* '())
  (if (not (memq filename *loaded-files*))
      (progn
	(load-file (expand-file-name (concat "~/.emacs.d/" filename ".el")))
	(add-to-list '*loaded-files* filename))))

(add-to-list 'load-path "~/.emacs.d/vendor")

(load-conf "org-mode")
(load-conf "settings")
(load-conf "packages")

(load-conf "evil")

; language modes
(load-conf "ruby-mode")
(load-conf "ruby-end")
(load-conf "markdown-mode")
(load-conf "scala-mode2")

;; ; editing
;; (load-conf "move-text")
;; (load-conf "keybindings")

;; ; dired
;; (load-conf "dired")

;; ; other
;; (load-conf "yasnippet")
;; (load-conf "deft")
;; (load-conf "ido")
;; (load-conf "themes")
;; (load-conf "term")
;; (load-conf "ensime")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("7cced48b557e24937f437e59c7f6a6cea5ace4e603377beb5067d0b2c27b4b7d" "3d6b08cd1b1def3cc0bc6a3909f67475e5612dba9fa98f8b842433d827af5d30" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
