(prelude-require-package 'multiple-cursors)
(require 'multiple-cursors)
(set-default 'truncate-lines nil)

(global-set-key (kbd "C-c >") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c <") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c .") 'mc/mark-all-dwim)

(defun ml-move-line-up ()
  "Move the current line up."
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun ml-move-line-down ()
  "Move the current line down."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

(global-set-key (kbd "C-n") 'ml-move-line-down)
(global-set-key (kbd "C-p") 'ml-move-line-up)

(defun uniq-lines (beg end)
  "Unique lines in region.
Called from a program, there are two arguments:
BEG and END (region to sort)."
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (while (not (eobp))
        (kill-line 1)
        (yank)
        (let ((next-line (point)))
          (while
              (re-search-forward
               (format "^%s" (regexp-quote (car kill-ring))) nil t)
            (replace-match "" nil nil))
          (goto-char next-line))))))

(defun backward-kill-word-or-region (arg)
  (interactive "p")
  (if (region-active-p)
      (kill-region (point) (mark))
    (backward-kill-word arg)))

(global-set-key (kbd "C-w") 'backward-kill-word-or-region)
(global-set-key (kbd "C-x C-w") 'whitespace-cleanup)

(global-set-key (kbd "M-RET") 'prelude-duplicate-current-line-or-region)

(delete-selection-mode +1)    ;; replace region with new content
(setq shift-select-mode -1) ;; disable selection with SHIFT

(defadvice kill-line (before check-position activate)
  "Call `just-one-space' after `kill-line'."
  (if (and (eolp) (not (bolp)))
      (progn (forward-char 1)
             (just-one-space 0)
             (backward-char 1))))
