(add-hook 'paredit-mode-hook
          (lambda ()
            (defun paredit-backward-kill-word-or-region ()
              (interactive "")
              (if (region-active-p)
                  (kill-region (point) (mark))
                (paredit-backward-kill-word)))

            (define-key paredit-mode-map (kbd "M-H") 'backward-word)
            (define-key paredit-mode-map (kbd "C-w") 'paredit-backward-kill-word-or-region)
            (define-key paredit-mode-map (kbd "M-L") 'forward-word)
            (define-key paredit-mode-map (kbd "M-J") (lambda () (interactive) (next-line 5)))))
