(require 'purescript-mode)
(add-to-list 'auto-mode-alist '("\\.purs$" . purescript-mode))
(add-hook 'purescript-mode-hook #'haskell-indentation-mode)
