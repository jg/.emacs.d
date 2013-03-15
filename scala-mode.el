(add-to-list 'load-path "~/.emacs.d/vendor/scala-mode")
(require 'scala-mode-auto)
(add-hook 'scala-mode-hook
      (lambda () (local-set-key (kbd "RET") 'newline-and-indent)))