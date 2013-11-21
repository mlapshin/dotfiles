(require 'color-theme)
(require 'color-theme-cool-dark)
(require 'maxframe)
(require 'smooth-scrolling)
(require 'popwin)

(color-theme-cool-dark)
(set-cursor-color "#0f0")

(add-hook 'window-setup-hook 'maximize-frame t)
(set-frame-font "DejaVu Sans Mono-10")

(remove-hook 'prog-mode-hook 'esk-turn-on-hl-line-mode)
