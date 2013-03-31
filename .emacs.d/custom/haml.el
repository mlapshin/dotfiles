(add-hook 'haml-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (define-key haml-mode-map "\C-m" 'newline-and-indent)
            (define-key haml-mode-map "\C-j" 'newline)
            (define-key haml-mode-map [backspace] 'delete-backward-char)))
