(define-key global-map (kbd "C-x C-r") 'rgrep)

;; don't ask if variables are safe
(setq enable-local-variables :all)
(setq dired-enable-local-variables :all)

(global-set-key (kbd "C-x C-g") 'magit-status)
