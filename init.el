;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defun load-conf (filename)
  "load the file in ~/.emacs.d/ unless it has already been loaded"
  (defvar *loaded-files* '())
  (if (not (memq filename *loaded-files*))
      (progn
	(load-file (expand-file-name (concat "~/.emacs.d/" filename ".el")))
	(add-to-list '*loaded-files* filename))))
(add-to-list 'load-path "~/.emacs.d/vendor")

(load-conf "settings")
(load-conf "packages")

; dependencies
; (load-conf "windata") ; for dirtree

(load-conf "evil")

; language modes
(load-conf "dockerfile-mode")
(load-conf "elixir-mode")
(load-conf "web-mode")
(load-conf "purescript-mode")
(load-conf "typescript-mode")
(load-conf "jsx-mode")
(load-conf "haskell-mode")
(load-conf "javascript-mode")
(load-conf "markdown-mode")
(load-conf "scala-mode2")
(load-conf "sh-mode")
(load-conf "html")
(load-conf "c-mode")
(load-conf "r-mode")
(load-conf "auctex")
(load-conf "ess")
(load-conf "merlin")

; ruby modes
(load-conf "rspec-mode")
(load-conf "ruby-mode")
(load-conf "ruby-end")
(load-conf "inf-ruby")

; editing
(load-conf "workgroups")
(load-conf "move-text")
; (load-conf "smart-parens")

; dired
(load-conf "dired")

; other
(load-conf "elscreen")
(load-conf "ace-jump-mode")
(load-conf "ag")
; (load-conf "org-babel")
; (load-conf "whitespace-mode")
(load-conf "org-mode")
(load-conf "git-blame")
(load-conf "yasnippet")
(load-conf "deft")
(load-conf "ido")
(load-conf "term")
(load-conf "speedbar")
(load-conf "flycheck")
; (load-conf "themes")
(load-conf "auto-indent-mode")
(load-conf "find-file-in-project")
(load-conf "dirtree")
(load-conf "ensime")
(load-conf "fiplr")
; (load-conf "bookmark+")
(load-conf "magit")
(load-conf "projectile")
(load-conf "ibuffer")
(load-conf "fill-column-indicator")
(load-conf "exec-path-from-shell")
; custom commands
(load-conf "insert-link-with-html-title")

(setq org-latex-pdf-process (quote ("texi2dvi --pdf --clean --verbose
--batch %f" "bibtex %b" "texi2dvi --pdf --clean --verbose --batch %f"
"texi2dvi --pdf --clean --verbose --batch %f")))

(load-conf "keybindings")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(org-agenda-files (quote ("~/documents/notes/todo.org")))
 '(safe-local-variable-values
   (quote
    ((eval progn
           (let
               ((plzoo-root-directory
                 (when buffer-file-name
                   (locate-dominating-file buffer-file-name ".dir-locals.el")))
                (plzoo-project-find-file
                 (and
                  (boundp
                   (quote plzoo-project-find-file))
                  plzoo-project-find-file)))
             (when plzoo-root-directory
               (setq tags-file-name
                     (concat plzoo-root-directory "TAGS"))
               (add-to-list
                (quote compilation-search-path)
                plzoo-root-directory)
               (if
                   (not plzoo-project-find-file)
                   (setq compile-command
                         (concat "make -C " plzoo-root-directory))))
             (setq plzoo-executable
                   (concat plzoo-root-directory "all"))))
     (haskell-process-use-ghci . t)
     (haskell-indent-spaces . 4)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
