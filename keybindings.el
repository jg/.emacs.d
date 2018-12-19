
; elscreen
;(global-unset-key (kbd "C-j"))
(define-key evil-normal-state-map (kbd "C-.") nil)
(global-set-key (kbd "C-j") nil)
(global-set-key (kbd "C-c c") 'elscreen-create)
(global-set-key (kbd "C-,") 'elscreen-next)
(global-set-key (kbd "C-.") 'elscreen-previous)

; ord-mode
(define-key org-mode-map (kbd "<backtab>") 'collapse-current-entry)
(define-key org-mode-map (kbd "<S-tab>") nil)
(define-key org-mode-map (kbd "<S-iso-lefttab>") nil)
(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key (kbd "<tab>") 'outline-toggle-children)
            (local-set-key (kbd "C-8") 'org-cycle)
            (local-set-key (kbd "C-*") 'org-shifttab)
            (local-set-key (kbd "C-<enter>") 'org-insert-heading-after-current)
            )
          )

(define-key evil-normal-state-map (kbd "C-:") 'load-current-file)

(define-key evil-normal-state-map (kbd "C-'") 'inferior-haskell-load-file)

; 
(define-key evil-normal-state-map (kbd "C-;") 'ido-describe-bindings)

; imenu
(define-key evil-normal-state-map (kbd "C-i") 'imenu)

; project explorer
(define-key evil-normal-state-map (kbd "C-o") 'project-explorer-toggle)
; (define-key evil-normal-state-map (kbd "C-e") 'project-explorer-close)

; inf-urby
(global-set-key (kbd "C-c r r") 'inf-ruby)

; unset unused global keys

(global-unset-key (kbd "C-\\"))

(defvar my-keys-minor-mode-map (make-keymap) "my keys minor mode keymap")

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)

; reload config
(define-key my-keys-minor-mode-map (kbd "C-c k") 'reload-config)

; magit
(define-key my-keys-minor-mode-map (kbd "C-c m") 'magit-status)

; buffer menu

; evil move by visual line
(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)

; (define-key my-keys-minor-mode-map (kbd "C-x C-b") 'buffer-menu)
(define-key my-keys-minor-mode-map (kbd "C-x C-b") 'ibuffer)

; desktop save/restore
(define-key my-keys-minor-mode-map (kbd "C-x c") 'bmkp-set-desktop-bookmark)
(define-key my-keys-minor-mode-map (kbd "C-x j") 'bmkp-desktop-jump)

; moving window
(define-key my-keys-minor-mode-map (kbd "C-x <up>") 'windmove-up)
(define-key my-keys-minor-mode-map (kbd "C-x <down>") 'windmove-down)
(define-key my-keys-minor-mode-map (kbd "C-x <right>") 'windmove-right)
(define-key my-keys-minor-mode-map (kbd "C-x <left>") 'windmove-left)

; editing
(define-key my-keys-minor-mode-map (kbd "C-u") 'evil-scroll-page-up)
(define-key my-keys-minor-mode-map (kbd "C-d") 'evil-scroll-page-down)
(define-key my-keys-minor-mode-map (kbd "C-k") 'kill-whole-line)

(define-key my-keys-minor-mode-map (kbd "C-k") 'kill-whole-line)
(define-key my-keys-minor-mode-map (kbd "C-\\") 'comment-or-uncomment-region)

; projectile
(define-key my-keys-minor-mode-map (kbd "C-c f") 'projectile-find-file)

; ag
(define-key my-keys-minor-mode-map (kbd "C-c g") 'ag-project)
(define-key my-keys-minor-mode-map (kbd "C-c s") 'ag-project-at-point)

; extensions
; (define-key my-keys-minor-mode-map (kbd "C-c f") 'fiplr-find-file)
(define-key my-keys-minor-mode-map (kbd "C-p") 'fiplr-find-file)

(define-key my-keys-minor-mode-map (kbd "C-l") 'deft)

(define-key my-keys-minor-mode-map (kbd "C-c o") 'dirtree)

(define-key my-keys-minor-mode-map (kbd "C-v") 'paste-from-clipboard)

; (define-key my-keys-minor-mode-map (kbd "C-,") 'speedbar)

; (define-key my-keys-minor-mode-map (kbd "C-c s") 'copy-file-name-to-clipboard)

; org-mode

; (define-key my-keys-minor-mode-map (kbd "C-c a t") 'org-todo-list)

(define-key my-keys-minor-mode-map (kbd "C-c a")   'org-agenda)

; (define-key my-keys-minor-mode-map (kbd "C-c c") 'change-next-eclosed-text)

(define-key my-keys-minor-mode-map (kbd "C-x p i") 'cliplink)

(my-keys-minor-mode 1)


; buffer mgmt

(define-key my-keys-minor-mode-map (kbd "C-x l") 'only-current-buffer)



(define-key my-keys-minor-mode-map (kbd "C-c i") 'insert-link-with-html-title)

; exit insert mode & save
(define-key my-keys-minor-mode-map (kbd "C-s ") (lambda ()
                                                  (interactive)
                                                  (save-buffer)
                                                  (evil-normal-state)
                                                  ))
(define-key my-keys-minor-mode-map (kbd "C-w ") (lambda ()
                                                  (interactive)
                                                  (save-buffer)
                                                  (evil-normal-state)
                                                  ))



; definitions

(defun my-minibuffer-setup-hook ()
  (my-keys-minor-mode 0))

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

(defadvice load (after give-my-keybindings-priority)
  "Try to ensure that my keybindings always have priority."
  (if (not (eq (car (car minor-mode-map-alist)) 'my-keys-minor-mode))
      (let ((mykeys (assq 'my-keys-minor-mode minor-mode-map-alist)))
        (assq-delete-all 'my-keys-minor-mode minor-mode-map-alist)
        (add-to-list 'minor-mode-map-alist mykeys))))
(ad-activate 'load)
(defvar my-keys-minor-mode-map (make-keymap) "my keys minor mode keymap")


; functions

(defun backward-kill-line ()
  "Kill ARG lines backward."
  (interactive)
  (kill-line 0))

;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))


(defun copy-file-name-to-clipboard ()
  "Puts the current file name on the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (with-temp-buffer
        (insert filename)
        (clipboard-kill-region (point-min) (point-max)))
      (message filename))))

(defun only-current-buffer ()
  "Kill all buffers except the current one"
  (interactive)
    (mapc 'kill-buffer (cdr (buffer-list (current-buffer)))))

(defun paste-from-clipboard ()
  (interactive)
  (clipboard-yank))

(defun straight-string (s)
  (mapconcat '(lambda (x) x) (split-string s) " "))

(defun extract-title-from-html (html)
  (let ((start (string-match "<title>" html))
        (end (string-match "</title>" html))
        (chars-to-skip (length "<title>")))
    (if (and start end (< start end))
        (substring html (+ start chars-to-skip) end)
      nil)))

(defun prepare-cliplink-title (title)
  (let ((replace-table '(("\\[" . "{")
                         ("\\]" . "}")
                         ("&mdash;" . "—")))
        (max-length 77)
        (result (straight-string title)))
    (dolist (x replace-table)
      (setq result (replace-regexp-in-string (car x) (cdr x) result)))
    (when (> (length result) max-length)
      (setq result (concat (substring result 0 max-length) "...")))
    result))

(defun perform-cliplink (buffer url content)
  (let* ((decoded-content (decode-coding-string content 'utf-8))
         (title (prepare-cliplink-title
                 (extract-title-from-html decoded-content))))
    (with-current-buffer buffer
      (insert (format "[[%s][%s]]" url title)))))

(defun cliplink ()
  (interactive)
  (let ((dest-buffer (current-buffer))
        (url (substring-no-properties (current-kill 0))))
    (url-retrieve
     url
     `(lambda (s)
        (perform-cliplink ,dest-buffer ,url
                          (buffer-string))))))


(defun my-mark-current-word (&optional arg allow-extend)
  "Select the word under cursor"
  (interactive "p\np")
  (setq arg (if arg arg 1))
  (if (and allow-extend
           (or (and (eq last-command this-command) (mark t))
               (region-active-p)))
      (set-mark
       (save-excursion
         (when (< (mark) (point))
           (setq arg (- arg)))
         (goto-char (mark))
         (forward-word arg)
         (point)))
    (let ((wbounds (bounds-of-thing-at-point 'word)))
      (unless (consp wbounds)
        (error "No word at point"))
      (if (>= arg 0)
          (goto-char (car wbounds))
        (goto-char (cdr wbounds)))
      (push-mark (save-excursion
                   (forward-word arg)
                   (point)))
      (activate-mark))))

(defun change-next-enclosed-text ()
  "Searches for the next quoted text, deletes it and lets you input a replacement"
  (interactive)
  (let (p1 p2)
    (progn
    (skip-chars-forward "^\"')") (setq p1 (point))
    (goto-char (1+ (point)))
    (skip-chars-forward "^\"')") (setq p2 (point))
    (delete-region (+ p1 1) p2)
    (evil-insert 1))))


(defun org-insert-website ()
  "Downloads website using url in clipboard to a directory with same name as buffer."
  (interactive)
  (let* (
         ; path to the directory of the current buffer. That directory has the same
         ; name as current buffer and the same parent directory
         (dir-path (file-name-as-directory (file-name-sans-extension (buffer-file-name))))
         ; url we got from the user
         (url (x-get-clipboard))
         ; parsed url
         (parsed-url (url-generic-parse-url url))
         ; command for archiving the website
         (cmd (concat "wget -pk -P " dir-path " " url))
         ; host part of the url
         (host (url-host parsed-url))
         ; path part of the url
         (url-path (first-present (list (url-filename parsed-url) "index.html")))
         ; path to the locally downloaded copy
         (local-path (concat dir-path host url-path))
        ; link formatted in org syntax pointing to the localy downloaded copy
        (local-link (concat "[[" local-path "]["))
        )
    ; make directory if it isn't present
    (if (file-exists-p dir-path) () (make-directory dir-path))
    ; invoke wget to download the website
    (shell-command-to-string cmd)
    ; insert org link to the local website in the current buffer
    (insert local-link)
  )
)

(defun detect (predicate-fn lst)
  "Returns first element from lst that matches the predicate"
  (when lst
    (if (funcall predicate-fn (car lst))
        (car lst)
        (detect predicate-fn (cdr lst)))))

(defun s-present? (s)
  "True when string is present"
  (not (s-blank? s)))

(defun first-present (lst)
  "Returns first string that is present in list"
  (detect 's-present? lst))

(defun load-current-file ()
  "Loads file in current buffer via load-file"
  (interactive)
  (load-file (buffer-file-name)))

(defun collapse-current-entry ()
  (interactive)
  (if (outline-on-heading-p)
      (progn
        (outline-up-heading 1)
        (hide-subtree))
    (hide-entry))
  )

(defun reload-config ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))
