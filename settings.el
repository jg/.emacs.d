; config
(setq scroll-step 1)
(setq auto-window-vscroll nil)
(tool-bar-mode -1)
(setq backup-directory-alist `(("." . "~/.saves")))
(setq undo-limit 3600)
(setq tab-width 2)
(setq indent-tabs-mode nil)
(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program "google-chrome")

; auto refresh when files change on disk
(global-auto-revert-mode t)
