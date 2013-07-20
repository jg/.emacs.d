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
(define-key my-keys-minor-mode-map (kbd "C-c c") 'reload-config)

; moving window
(define-key my-keys-minor-mode-map (kbd "C-x <up>") 'windmove-up)
(define-key my-keys-minor-mode-map (kbd "C-x <down>") 'windmove-down)
(define-key my-keys-minor-mode-map (kbd "C-x <right>") 'windmove-right)
(define-key my-keys-minor-mode-map (kbd "C-x <left>") 'windmove-left)

; editing
; (define-key my-keys-minor-mode-map (kbd "C-u") 'backward-kill-line)
(define-key my-keys-minor-mode-map (kbd "C-k") 'kill-whole-line)

(define-key my-keys-minor-mode-map (kbd "C-k") 'kill-whole-line)
(define-key my-keys-minor-mode-map (kbd "C-\\") 'comment-or-uncomment-region)

; extensions
(define-key my-keys-minor-mode-map (kbd "C-c f") 'find-file-in-project)

(define-key my-keys-minor-mode-map (kbd "C-l") 'deft)

(define-key my-keys-minor-mode-map (kbd "C-c o") 'dirtree)

(define-key my-keys-minor-mode-map (kbd "C-y") 'speedbar)


(my-keys-minor-mode 1)

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
