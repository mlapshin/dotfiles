(add-hook 'coffee-mode-hook
          (lambda ()
            (paredit-mode 0)
            (auto-complete-mode 1)))
