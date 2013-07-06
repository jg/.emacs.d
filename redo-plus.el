(add-to-list 'load-path "~/.emacs.d/vendor/redo-plus")
(require 'redo+)
(global-set-key (kbd "C-?") 'redo)
(setq undo-no-redo t)