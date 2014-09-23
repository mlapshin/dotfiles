(require 'auto-complete)
(require 'auto-complete-config)
(require 'auto-complete-etags)
(global-set-key (kbd "M-/") 'auto-complete)

;; JK keys in AC menu
(define-key ac-menu-map (kbd "M-k") 'ac-previous)
(define-key ac-menu-map (kbd "M-j") 'ac-next)
(define-key ac-menu-map (kbd "C-s") 'ac-isearch)
(define-key ac-menu-map [return] 'ac-complete)

(defun ac-common-setup ()
  (add-to-list 'ac-sources 'ac-source-etags))

(ac-config-default)

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))

(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
