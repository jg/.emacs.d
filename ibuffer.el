(require 'ibuf-ext)
(add-to-list 'ibuffer-never-show-predicates "^\\*")

(evil-add-hjkl-bindings ibuffer-mode-map 'emacs)
