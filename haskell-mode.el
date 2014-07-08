(require 'haskell-mode)


(add-hook 'haskell-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'reindent-then-newline-and-indent)))
