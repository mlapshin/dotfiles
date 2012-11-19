(add-hook 'coffee-mode-hook
          (lambda ()
            (paredit-mode 0)
            (auto-complete-mode 1)
            (define-key coffee-mode-map "\C-m" 'coffee-newline-and-indent)
            (define-key coffee-mode-map "\C-j" 'coffee-newline-and-indent)))
