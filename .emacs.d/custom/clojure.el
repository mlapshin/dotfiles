(require 'ac-nrepl)

(add-hook 'clojure-mode-hook
          (lambda ()
            (paredit-mode t)))

(add-hook 'nrepl-mode-hook
          (lambda ()
            (paredit-mode t)))


(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)


