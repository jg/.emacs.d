; nonblinking cursor
(blink-cursor-mode 0)

; font size
(set-face-attribute 'default nil :height 120)

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

; no splash screens
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)

;; Remove toolbar, scrollbar and menu bar
(if (and (fboundp 'tool-bar-mode)
	 (fboundp 'scroll-bar-mode)
         (fboundp 'menu-bar-mode))
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)
      (menu-bar-mode 0)))

; auto refresh when files change on disk
(global-auto-revert-mode t)

; Increase undo size
(setq undo-limit 2000000)
(setq undo-strong-limit 3000000)

;; make scrolling nicer
(setq
 scroll-margin 4
 scroll-conservatively 1000
 scroll-preserve-screen-position 1)

;; show column number
(column-number-mode 1)

;; don't create annoying files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; highlighting
(setq query-replace-highlight t)
(setq search-highlight t)

(setq font-lock-maximum-decoration 3)

(fset 'yes-or-no-p 'y-or-n-p)

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
