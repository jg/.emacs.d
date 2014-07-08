(require 'package)
(setq package-archives '())
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(setq required-packages (list
                               'flycheck
                               'ag
                               'git-blame

                               ; generic
                               'maxframe
                               'dired-details
                               'edit-server
                               'melpa
                               
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
                               'nrepl
                               'org
                               'org-plus-contrib
                               'deft
                               'gist

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

                               ; other
                               'tree-mode
                               'projectile
                               ))

(dolist (package required-packages)
  (when (not (package-installed-p package))
    (package-refresh-contents)
    (package-install package)))
