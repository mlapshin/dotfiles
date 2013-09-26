(add-hook 'clojure-mode-hook
          (lambda ()
            (paredit-mode t)))

(add-hook 'nrepl-mode-hook
          (lambda ()
            (paredit-mode t)))
