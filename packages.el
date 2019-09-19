(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(when (not package-archive-contents) (package-refresh-contents))

; (setq package-archives '())

; melpa http://melpa.org/#/getting-started
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
; (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
; (add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
; (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
; (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
; (add-to-list 'package-archives '("melpa" . "https://stable.melpa.org/packages/"))

(setq required-packages (list
                         'elixir-mode
                         'avy
                         'elscreen
                         'web-mode
                         'free-keys
                         'w3m
                         'sml-mode
                         'elm-mode
                         'isend-mode
                         'tss
                         'tuareg
                         'evil
                         'scala-mode
                         'ruby-end
                         'inf-ruby
                         'textmate
                         'ido-ubiquitous
                         'ido-vertical-mode
                         'auto-indent-mode
                         'find-file-in-project
                         'dirtree
                         'exec-path-from-shell
                         'rbenv

                         'flycheck
                         'ag
                                        ; generic
                         'maxframe
                         'dired-details
                         'edit-server

                                        ; editing
                         'move-text
                         'ace-jump-mode
                         'annoying-arrows-mode
                         'volatile-highlights
                         'rainbow-mode
                         'undo-tree
                         'flymake-cursor
                         'yasnippet
                         'highlight-indentation
                         'git-gutter-fringe
                         'smartparens
                         'folding

                                        ; tools
                         'magit
                         'org
                         ; 'org-plus-contrib
                         'deft
                         'gist
                         'git-timemachine
                         'gnuplot

                                        ; language tools
                         'flymake-css
                         'flymake-sass
                         'flymake-ruby
                         'flymake-jshint
                         'zencoding-mode
                         'js2-refactor
                         'rsense

                                        ; language modes
                         'coffee-mode
                         'feature-mode
                         'haml-mode
                         'js2-mode
                         'puppet-mode
                         'rspec-mode
                         'sass-mode
                         'scss-mode
                         'crontab-mode
                         'csv-mode
                         'yaml-mode
                         'markdown-mode
                         'clojure-mode
                         'gitconfig-mode
                         'haml-mode
                         'haskell-mode
                         'textmate
                         'tide
                         'hamlet-mode
                         'psci

                                        ; other
                         'tree-mode
                         'projectile
                         ))

(dolist (package required-packages)
  (when (not (package-installed-p package))
    (package-install package)))
