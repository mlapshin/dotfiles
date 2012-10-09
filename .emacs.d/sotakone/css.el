(add-hook 'css-mode-hook
          (lambda ()
            (rainbow-mode 1)))

(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . css-mode))
