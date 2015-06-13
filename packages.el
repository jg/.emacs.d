(require 'package)
(setq package-archives '())
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(setq required-packages (list
                               'evil
                               'scala-mode2
                               'ruby-end
                               'inf-ruby
                               'textmate
                               'ido-ubiquitous
                               'ido-vertical-mode
                               'auto-indent-mode
                               'find-file-in-project
                               'dirtree
                               'exec-path-from-shell

                               'flycheck
                               'ag
                               'git-blame

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

                               ; tools
                               'magit
                               'org
                               'org-plus-contrib
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
                               'git-commit-mode
                               'gitconfig-mode
                               'haml-mode
                               'haskell-mode
                               'textmate

                               ; other
                               'tree-mode
                               'projectile
                               'bookmark+
                               ))

(dolist (package required-packages)
  (when (not (package-installed-p package))
    (package-refresh-contents)
    (package-install package)))
