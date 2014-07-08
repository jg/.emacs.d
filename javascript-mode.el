
(add-hook 'js-mode-hook
  (lambda ()
	(local-set-key (kbd "RET") 'reindent-then-newline-and-indent)
  (setq show-trailing-whitespace t)
  (flycheck-mode)
	; (highlight-lines-matching-regexp ".\\{81\\}" 'hi-green)
	))
