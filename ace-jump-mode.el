(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(setq ace-jump-mode-move-keys (loop for i from ?a to ?z collect i))
