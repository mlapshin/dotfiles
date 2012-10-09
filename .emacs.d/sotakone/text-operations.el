;; Marking lines (like LINE VISUAL MODE in VIM)
(global-set-key [(control x) (control p)] 'mark-lines-previous-line)
(global-set-key [(control x) (control n)] 'mark-lines-next-line)

;; Killing customizations
(defadvice kill-ring-save (before slickcopy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

(defadvice kill-region (before slickcut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

(defun backward-kill-word-or-region (arg)
  (interactive "p")
  (if (region-active-p)
      (kill-region (point) (mark))
    (backward-kill-word arg)))

(global-set-key (kbd "C-w") 'backward-kill-word-or-region)

;; Undo on C-z
(global-set-key (kbd "C-z") 'undo)

;; Search
;; I-search with initial contents
(defvar isearch-initial-string nil)

(defun isearch-set-initial-string ()
  (remove-hook 'isearch-mode-hook 'isearch-set-initial-string)
  (setq isearch-string isearch-initial-string)
  (isearch-search-and-update))

(defun isearch-forward-at-point (&optional regexp-p no-recursive-edit)
  "Interactive search forward for the symbol at point."
  (interactive "P\np")
  (if regexp-p (isearch-forward regexp-p no-recursive-edit)
    (let* ((end (progn (skip-syntax-forward "w_") (point)))
           (begin (progn (skip-syntax-backward "w_") (point))))
      (if (eq begin end)
          (isearch-forward regexp-p no-recursive-edit)
        (setq isearch-initial-string (buffer-substring begin end))
        (add-hook 'isearch-mode-hook 'isearch-set-initial-string)
        (isearch-forward regexp-p no-recursive-edit)))))

(global-set-key (kbd "C-8") 'isearch-forward-at-point)
(define-key isearch-mode-map (kbd "M-j") 'isearch-repeat-forward)
(define-key isearch-mode-map (kbd "M-k") 'isearch-repeat-backward)

; Ctrl+D / Delete
(global-set-key "\C-d" 'kill-word)
(global-set-key [delete] 'delete-char)

(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key "\C-x\C-k" 'kill-region)

;; Duplicate current line
(defun duplicate-line (&optional counts)
  "Duplicates current line"
  (interactive "P")
  (mark-lines-next-line nil)
  (let ((line (buffer-substring (region-beginning) (region-end))))
    (deactivate-mark)
    (move-end-of-line nil)
    (dotimes (n (or 1 counts))
      (insert line)
      (previous-line))))

(global-set-key (kbd "C-d") 'duplicate-line)
