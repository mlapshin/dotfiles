(defalias 'yes-or-no-p 'y-or-n-p)
(require 'mark-lines)

(defun kill-current-buffer ()
      (interactive)
      (kill-buffer (current-buffer)))

(define-key global-map (kbd "C-x C-k") 'kill-current-buffer)
(define-key global-map (kbd "C-x C-r") 'rgrep)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x C-w") 'whitespace-cleanup)

(global-set-key (kbd "M-Z") 'zap-up-to-char)
(global-set-key (kbd "C-x j") 'join-line)
(global-set-key (kbd "C-x t") 'transpose-lines)

(global-set-key (kbd "<f5>") 'compile)

(global-unset-key (kbd "C-x C-z"))

(global-unset-key (kbd "C-x C-c"))
(global-set-key (kbd "C-x C-c C-c") 'save-buffers-kill-terminal)

(global-set-key (kbd "<f11>") 'linum-mode)

(defvar stk-window-maximized-original-configuration nil)

(defun stk-maximize-or-restore-window ()
  "Maximizes current window or restores original window configuration"
  (interactive)
  (if stk-window-maximized-original-configuration
      (progn
        (set-window-configuration stk-window-maximized-original-configuration)
        (setq stk-window-maximized-original-configuration nil))
    (progn
      (setq stk-window-maximized-original-configuration (current-window-configuration))
      (maximize-window))))

(global-set-key (kbd "<f12>") 'stk-maximize-or-restore-window)

(add-hook 'after-init-hook (lambda ()
                             ;; C-z should be rebinded at the end of initialization
                             (global-unset-key (kbd "C-z"))))

(require 'projectile)
(projectile-global-on)
