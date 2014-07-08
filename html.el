(add-hook 'html-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'reindent-then-newline-and-indent)))
