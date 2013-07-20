(require 'ruby-end)
(setq ruby-end-insert-newline nil)
(add-hook 'ruby-mode-hook (lambda () (ruby-end-mode)))
