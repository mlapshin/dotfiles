(setq-default standard-indent 2
              tab-width 2
              web-mode-code-indent-offset 2
              web-mode-markup-indent-offset 2
              js-indent-level 2
              js2-basic-offset 2
              indent-tabs-mode nil
              shift-select-mode -1
              kill-do-not-save-duplicates 't)

(delete-selection-mode +1)    ;; replace region with new content

(defvar yank-advised-indent-threshold 1024
  "Threshold (# chars) over which indentation does not automatically occur.")

(defun yank-advised-indent-function (beg end)
  "Do indentation, as long as the region isn't too large."
  (if (<= (- end beg) yank-advised-indent-threshold)
      (indent-region beg end nil)))

(defadvice yank (after yank-indent activate)
  "Indent yanked text (with prefix arg don't indent)."
  (if (not (ad-get-arg 0))
      (let ((transient-mark-mode nil))
        (yank-advised-indent-function (region-beginning) (region-end)))))

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

(use-package crux
  :config
  (require 'crux)
  (crux-with-region-or-buffer indent-region)

  :bind (("M-RET" . crux-duplicate-current-line-or-region)
	 ("C-M-\\" . crux-cleanup-buffer-or-region)))

(use-package browse-kill-ring
  :bind (("M-y" . browse-kill-ring)
	 :map browse-kill-ring-mode-map
	 ("M-j" . browse-kill-ring-forward)
	 ("M-k" . browse-kill-ring-previous)))

(use-package restclient)
