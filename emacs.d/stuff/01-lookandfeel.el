(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(use-package powerline)

(use-package moe-theme
  :config
  (setq moe-theme-highlight-buffer-id nil)
  (setq moe-theme-mode-line-color 'orange)

  (moe-dark)
  (powerline-moe-theme)

  (when window-system
    (set-face-attribute 'default nil :height 135)))

(defalias 'yes-or-no-p 'y-or-n-p)
