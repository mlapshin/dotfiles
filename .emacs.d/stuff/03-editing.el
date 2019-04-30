(setq standard-indent 2
      tab-width 2
      web-mode-code-indent-offset 2
      web-mode-markup-indent-offset 2)

(delete-selection-mode +1)    ;; replace region with new content
(setq shift-select-mode -1) ;; disable selection with SHIFT
(setq kill-do-not-save-duplicates 't)

(defun backward-kill-word-or-region (arg)
  (interactive "p")
  (if (region-active-p)
      (kill-region (point) (mark))

    (if (bound-and-true-p smartparens-mode)
        (sp-backward-kill-word arg)

      (if (bound-and-true-p subword-mode)
          (subword-backward-kill arg)
        (backward-kill-word arg)))))

(defadvice kill-line (before check-position activate)
  "Call `just-one-space' after `kill-line'."
  (if (and (eolp) (not (bolp)))
      (progn (forward-char 1)
             (just-one-space 0)
             (backward-char 1))))

(global-set-key (kbd "C-w") 'backward-kill-word-or-region)
(global-set-key (kbd "C-x C-w") 'whitespace-cleanup)

(global-set-key (kbd "M-RET") 'crux-duplicate-current-line-or-region)
