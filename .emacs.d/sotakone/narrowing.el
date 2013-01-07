(global-unset-key (kbd "C-n"))

(global-set-key (kbd "C-n C-n") 'narrow-to-region)
(global-set-key (kbd "C-n C-d") 'narrow-to-defun)
(global-set-key (kbd "C-n C-w") 'widen)
