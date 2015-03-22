; unset unused global keys

(global-unset-key (kbd "C-\\"))

(defvar my-keys-minor-mode-map (make-keymap) "my keys minor mode keymap")

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)

; reload config
(defun reload-config ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))
(define-key my-keys-minor-mode-map (kbd "C-c k") 'reload-config)

; [textmate] goto symbol
(define-key my-keys-minor-mode-map (kbd "C-c p") 'textmate-goto-symbol)

; [textmate] goto file
(define-key my-keys-minor-mode-map (kbd "C-c f") 'textmate-goto-file)

; magit
(define-key my-keys-minor-mode-map (kbd "C-c m") 'magit-status)

; status
(define-key my-keys-minor-mode-map (kbd "C-c m") 'magit-status)

; default 'k' binding already taken by hjkl keys
(define-key magit-status-mode-map (kbd "d") 'magit-discard-item)

; add jk movement keys to magit rebase mode
(eval-after-load "rebase-mode"
    '(progn
       (define-key rebase-mode-map (kbd "n") 'rebase-mode-move-line-down)
       (define-key rebase-mode-map (kbd "p") 'rebase-mode-move-line-up)
       (define-key rebase-mode-map (kbd "j") 'forward-line)
       (define-key rebase-mode-map (kbd "k") '(lambda(n)
                                                (interactive "p")
                                                (forward-line (* n -1))))))

; add hjkl bindings
(evil-add-hjkl-bindings magit-branch-manager-mode-map 'emacs)
(evil-add-hjkl-bindings magit-status-mode-map 'emacs)
(evil-add-hjkl-bindings magit-commit-mode-map 'emacs)
(evil-add-hjkl-bindings magit-log-mode-map 'emacs)
(evil-add-hjkl-bindings magit-diff-mode-map 'emacs)

(define-key my-keys-minor-mode-map (kbd "C-c g") 'magit-status)

; buffer menu

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
(define-key my-keys-minor-mode-map (kbd "C-c r") 'projectile-find-file)

; extensions
; (define-key my-keys-minor-mode-map (kbd "C-c f") 'fiplr-find-file)
(define-key my-keys-minor-mode-map (kbd "C-p") 'fiplr-find-file)

(define-key my-keys-minor-mode-map (kbd "C-l") 'deft)

(define-key my-keys-minor-mode-map (kbd "C-c o") 'dirtree)

(define-key my-keys-minor-mode-map (kbd "C-v") 'paste-from-clipboard)

; (define-key my-keys-minor-mode-map (kbd "C-y") 'speedbar)

(define-key my-keys-minor-mode-map (kbd "C-c s") 'copy-file-name-to-clipboard)

; org-mode

; (define-key my-keys-minor-mode-map (kbd "C-c a t") 'org-todo-list)

(define-key my-keys-minor-mode-map (kbd "C-c a")   'org-agenda)

(define-key my-keys-minor-mode-map (kbd "C-c c") 'org-capture)

(define-key my-keys-minor-mode-map (kbd "C-x p i") 'cliplink)

(my-keys-minor-mode 1)


; buffer mgmt

(define-key my-keys-minor-mode-map (kbd "C-x l") 'only-current-buffer)



(define-key my-keys-minor-mode-map (kbd "C-c i") 'insert-link-with-html-title)


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
  "Put the current file name on the clipboard"
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
