(setq projectile-completion-system 'grizzl)

(global-set-key (kbd "C-x C-p") 'projectile-find-file)

(eval-after-load 'grizzl
  '(progn
     (define-key *grizzl-keymap* (kbd "M-j") 'grizzl-set-selection-1)
     (define-key *grizzl-keymap* (kbd "M-k") 'grizzl-set-selection+1)))
