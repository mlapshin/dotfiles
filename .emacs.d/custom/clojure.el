(add-hook 'clojure-mode-hook
          (lambda ()
            (paredit-mode t)))

(define-key paredit-mode-map (kbd "M-H") 'paredit-backward)
(define-key paredit-mode-map (kbd "M-L") 'paredit-forward)
(define-key paredit-mode-map (kbd "C-w") 'paredit-backward-kill-word)
(define-key paredit-mode-map (kbd "M-J") (lambda () (interactive) (next-line 5)))
