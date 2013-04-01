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

(defun prelude-move-line-up ()
  "Move the current line up."
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun prelude-move-line-down ()
  "Move the current line down."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

(global-set-key (kbd "C-n") 'prelude-move-line-down)
(global-set-key (kbd "C-p") 'prelude-move-line-up)

(defun sudo-edit (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

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
(global-set-key [delete] 'delete-char)

(global-set-key (kbd "C-c C-k") 'kill-region)

;; duplicate current line
(defun duplicate-current-line (&optional n)
  "duplicate current line, make more than 1 copy given a numeric argument"
  (interactive "p")
  (save-excursion
    (let ((nb (or n 1))
          (current-line (thing-at-point 'line)))
      ;; when on last line, insert a newline first
      (when (or (= 1 (forward-line 1)) (eq (point) (point-max)))
        (insert "\n"))

      ;; now insert as many time as requested
      (while (> n 0)
        (insert current-line)
        (decf n)))))

(global-set-key (kbd "C-d") 'duplicate-current-line)

(global-set-key (kbd "<M-return>") (lambda (&optional n)
                               (interactive "p")
                               (move-end-of-line 1)
                               (reindent-then-newline-and-indent)))
