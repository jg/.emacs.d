(require 'haskell-mode)


(add-hook 'haskell-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'reindent-then-newline-and-indent)))


(defun create-haskell-tags (dir-name)
  "Create tags file in a haskell project"
  (interactive "DDirectory: ")
  (eshell-command
   (format "find %s -type f -name *.hs | hasktags -e STDIN" dir-name)))
