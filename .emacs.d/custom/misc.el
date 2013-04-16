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

(global-set-key (kbd "<f11>") 'linum-mode)

(defvar window-maximized nil
  "When t, window is maximized and next call to maximize-or-balance-window
function will balance window instead of maximizing it")

(defun maximize-or-balance-window ()
  "Maximizes or balances current window"
  (interactive)
  (message "Window maximized: %s" window-maximized)
  (if window-maximized
      (balance-windows)
    (maximize-window))
  (setf window-maximized (not window-maximized)))

(global-set-key (kbd "<f12>") 'maximize-or-balance-window)

(add-hook 'after-init-hook (lambda ()
                             ;; C-z should be rebinded at the end of initialization
                             (global-unset-key (kbd "C-z"))))