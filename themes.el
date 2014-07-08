(require 'color-theme)
(color-theme-initialize)
(color-theme-vim-colors)

(setq evil-default-cursor t)

(setq initial-frame-alist
      '((foreground-color . "grey80")
        (background-color . "black")
        (background-mode . dark)
        (cursor-color     . "red")))
(setq default-frame-alist
      '((foreground-color . "grey80")
        (background-color . "black")
        (background-mode  . 'dark)
        (cursor-color     . "red")))

(set-cursor-color "red")

; (set-face-foreground 'minibuffer-prompt "black")
; (set-face-background 'minibuffer-prompt "black")
; '(minibuffer-prompt ((t (:background "black" :foreground "white" :inverse-video nil :underline nil :slant normal :weight bold)))))
