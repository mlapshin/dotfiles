;; (prelude-require-package 'auto-complete)
;; auto-complete-mode is vendored for now

(require 'auto-complete)
(require 'auto-complete-config)

;; turn off flycheck mode cause it breaks AC UI
(global-flycheck-mode -1)

;; default config
(ac-config-default)

(setq ac-trigger-key "TAB")
(setq ac-use-menu-map t)
(setq ac-stop-flymake-on-completing t)
(setq ac-auto-start nil)
(setq ac-fuzzy-enable nil)
(setq ac-show-menu-immediately-on-auto-complete t)
(setq ac-disable-inline t)

;; JK keys in AC menu
(define-key ac-menu-map (kbd "M-k") 'ac-previous)
(define-key ac-menu-map (kbd "M-j") 'ac-next)
(define-key ac-menu-map (kbd "C-s") 'ac-isearch)
(define-key ac-menu-map [return] 'ac-complete)

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))

(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

(setq ac-modes
      (append '(comint-mode css-mode less-css-mode coffee-mode)
              ac-modes))
