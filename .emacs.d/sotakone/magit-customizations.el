(global-set-key (kbd "C-x C-g") 'magit-status)

(eval-after-load 'magit
  '(progn
     (add-hook 'magit-mode-hook
               (lambda()
                 (define-key (current-local-map) (kbd "M-h") nil)
                 (define-key (current-local-map) (kbd "M-H") nil)))))
