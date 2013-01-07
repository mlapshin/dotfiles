(global-unset-key (kbd "C-n"))

(defun narrow-dwim (begin end)
  "If buffer is not narrowed, narrow it to region or defun. If narrowed, widen it."
  (interactive "r")
  (if (and (eq (point-min) 1)
           (eq (- (point-max) 1) (buffer-size)))
      (if mark-active
          (narrow-to-region begin end)
        (if (eq major-mode 'ruby-mode)
            (narrow-to-ruby-def)
          (narrow-to-defun)))
        (widen)))

(global-set-key (kbd "C-n C-n") 'narrow-dwim)
(global-set-key (kbd "C-n C-d") 'narrow-to-defun)
(global-set-key (kbd "C-n C-w") 'widen)
