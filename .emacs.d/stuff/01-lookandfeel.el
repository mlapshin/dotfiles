(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-screen t)
(setq scroll-step 1)

(use-package powerline)

(use-package moe-theme
  :config
  (setq moe-theme-highlight-buffer-id nil)
  (setq moe-theme-mode-line-color 'orange)

  (moe-dark)
  (powerline-moe-theme)

  (when window-system
    (set-face-attribute 'default nil :family "Hack" :height 135)))

;; (set-face-attribute 'whitespace-line nil
;; 		    :foreground 'unspecified
;; 		    :background "#dadada")

;; (set-face-attribute 'whitespace-tab nil
;; 		    :inherit nil
;; 		    :background "white"
;; 		    :foreground 'unspecified)

(defalias 'yes-or-no-p 'y-or-n-p)
