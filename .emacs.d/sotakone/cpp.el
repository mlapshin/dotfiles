(require 'google-c-style)

(add-hook 'c++-mode-hook
          (lambda ()
            (define-key c++-mode-map (kbd "M-j") nil)
            (define-key c++-mode-map (kbd "C-M-h") nil)
            (define-key c++-mode-map (kbd "C-M-j") nil)))

(add-hook 'c-mode-common-hook 'google-set-c-style)
