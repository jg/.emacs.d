(require 'haskell-mode)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)




;; (add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
;; (add-to-list 'auto-mode-alist '("\\.purs$" . haskell-mode))

;; (add-hook 'haskell-mode-hook '(lambda ()
;;   (local-set-key (kbd "RET") 'reindent-then-newline-and-indent)))


;; (defun create-haskell-tags (dir-name)
;;   "Create tags file in a haskell project"
;;   (interactive "DDirectory: ")
;;   (eshell-command
;;    (format "find %s -type f -name *.hs | hasktags -e STDIN" dir-name)))

;; (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
;; (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
;; (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
;; (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
;; (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
;; (define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
;; (define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
;; (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
