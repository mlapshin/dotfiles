(require 'color-theme)
(require 'color-theme-cool-dark)
(require 'maxframe)

(require 'smooth-scrolling)

(color-theme-cool-dark)
(set-cursor-color "#0f0")
(add-hook 'window-setup-hook 'maximize-frame t)

;; (add-hook 'css-mode-hook  (lambda () (rainbow-mode)))
;; (add-hook 'sass-mode-hook (lambda () (rainbow-mode)))
