(add-hook 'coffee-mode-hook
          (lambda ()
            (paredit-mode 0)
            (auto-complete-mode 1)
            (define-key haml-mode-map "\C-m" 'newline-and-indent)))
