(require 'color-theme)
(require 'maxframe)
(require 'smooth-scrolling)
(require 'popwin)

(load-theme 'solarized-light t)
(set-cursor-color "#0f0")

(add-hook 'window-setup-hook 'maximize-frame t)
(set-frame-font "DejaVu Sans Mono-10")

(remove-hook 'prog-mode-hook 'esk-turn-on-hl-line-mode)
