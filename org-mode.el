(require 'org)

(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
; (global-set-key "\C-cl" 'org-store-link)
; (global-set-key "\C-cb" 'org-iswitchb)

(setq org-log-done 'time)

; code highlighting in blocks
; (setq org-src-fontify-natively t)

; set indent
(setq org-indent-indentation-per-level 2)

; clean outline view
(setq org-hide-leading-stars t)

; display inline images by default
(setq org-startup-with-inline-images t)

; sub/superscripts are nice
(setq org-use-sub-supescripts t)

(require 'ox-publish)
(require 'ox-html)
(setq org-publish-project-alist
      '(

        ("org-notes"
         :base-directory "~/documents/org-notes/"
         :base-extension "org"
         :publishing-directory "~/documents/org-notes-compiled/"
         :publishing-function org-html-publish-to-html
         :auto-preamble t
         )

        ("notes" :components ("org-notes"))
))

; longlines (add-hook 'org-mode-hook 'visual-line-mode) ; Move to the end of the first line and press C-x C-e to load org-publish. Now go to the end of the last line and press C-x C-e again. Repeat the last step after every change to your org-publish-project-alist.

; To publish your Org-mode files just type M-x org-publish-project RET org RET or use one of the shortcuts listed in the manual.

; Now M-x org-publish-project RET org RET publishes everything recursively to ~/public_html/. Target directories are created, if they don't yet exist.

(setq org-todo-keywords
      '((sequence "TODO" "IN PROGRESS" "|" "DONE")))

(setq org-default-notes-file (concat org-directory "~/documents/notes/notes.org"))


(setq org-capture-templates
 '(("t" "Todo" entry (file+headline "~/documents/notes/todo.org" "backlog")
        "* TODO %?")
   ("j" "Journal" entry (file+datetree "~/documents/notes/journal.org")
        "* %?\nEntered on %U\n  %i\n  %a")))
