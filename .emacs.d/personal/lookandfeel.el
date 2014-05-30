(prelude-require-packages '(moe-theme
                            powerline
                            flx
                            smooth-scroll))

(require 'flx) ;; fix: missing face flx-highlight-face on mac os

;;(require 'powerline)
(require 'moe-theme)
(require 'smooth-scroll)

;; jump between windows by numbers
(require 'window-numbering)
(window-numbering-mode t)

(setq global-hl-line-mode nil
      smooth-scroll-mode t
      smooth-scroll-margin 3
      visible-bell t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(defun ml-customize-faces ()
  (dolist (face '(font-lock-keyword-face))
    (set-face-attribute face nil :weight 'bold))

  (set-face-attribute 'window-numbering-face nil :foreground "black" :weight 'bold)
  (set-face-background 'mode-line-buffer-id 'unspecified)
  (set-face-attribute 'flx-highlight-face nil :inherit 'highlight :underline nil)
  (set-face-attribute 'flycheck-warning nil :inherit 'unspecified)

  (set-face-attribute 'whitespace-line nil
                      :foreground 'unspecified
                      :background "#dadada")

  (set-face-attribute 'ac-candidate-face nil
                      :background "#d7d7af"
                      :foreground 'unspecified
                      :weight 'unspecified)

  (set-face-attribute 'ac-selection-face nil
                      :inherit nil
                      :background "#ffff87"
                      :foreground 'unspecified
                      :weight 'bold)

  (set-face-foreground 'sp-show-pair-match-face "white")
  (set-face-attribute 'whitespace-tab nil
                      :inherit nil
                      :background "white"
                      :foreground 'unspecified)

  (dolist (face '(whitespace-empty whitespace-hspace))
    (set-face-attribute face nil :background 'unspecified)))

(defun ml-light-theme ()
  (setq moe-theme-highlight-buffer-id nil)
  (setq moe-theme-mode-line-color 'blue)
  (setq moe-light-pure-white-background-in-terminal t)

  (moe-light))

(ml-light-theme)

(add-hook 'after-init-hook 'ml-customize-faces)

;; use only one desktop
;; (setq desktop-path '("~/.emacs.d/")
;;       desktop-dirname "~/.emacs.d/"
;;       desktop-restore-eager 0)

;; (desktop-save-mode +1)
