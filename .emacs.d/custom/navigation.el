(defun smart-beginning-of-line ()
  (interactive)

  (let ((saved-point (point)))
    (beginning-of-line-text)
    (message "Saved point %s, current point %s" saved-point (point))
    (if (= saved-point (point))
        (beginning-of-line))))

(defun stk-unset-hjkl-keys ()
  "Unsets HJKL movement keys in current mode"
  (define-key (current-local-map) (kbd "M-h") nil)
  (define-key (current-local-map) (kbd "M-l") nil)
  (define-key (current-local-map) (kbd "M-k") nil)
  (define-key (current-local-map) (kbd "M-j") nil)

  (define-key (current-local-map) (kbd "M-J") nil)
  (define-key (current-local-map) (kbd "M-K") nil)
  (define-key (current-local-map) (kbd "M-H") nil)
  (define-key (current-local-map) (kbd "M-L") nil)

  (define-key (current-local-map) (kbd "C-M-h") nil)
  (define-key (current-local-map) (kbd "C-M-l") nil)
  (define-key (current-local-map) (kbd "C-M-k") nil)
  (define-key (current-local-map) (kbd "C-M-j") nil))

;; make cursor movement keys under right hand's home-row.
(global-set-key (kbd "M-h") 'backward-char)
(global-set-key (kbd "M-l") 'forward-char)
(global-set-key (kbd "M-k") 'previous-line)
(global-set-key (kbd "M-j") 'next-line)
(global-set-key (kbd "M-р") 'backward-char)
(global-set-key (kbd "M-д") 'forward-char)
(global-set-key (kbd "M-л") 'previous-line)
(global-set-key (kbd "M-о") 'next-line)

(global-set-key (kbd "C-a") 'smart-beginning-of-line)

(global-set-key (kbd "M-J") 'scroll-up)
(global-set-key (kbd "M-K") 'scroll-down)
(global-set-key (kbd "M-H") 'backward-word)
(global-set-key (kbd "M-L") 'forward-word)
(global-set-key (kbd "M-Р") 'backward-char)
(global-set-key (kbd "M-Д") 'forward-char)
(global-set-key (kbd "M-Л") 'previous-line)
(global-set-key (kbd "M-О") 'next-line)

;; Windows navigation
(global-set-key (kbd "C-M-h") 'windmove-left) ; move to left windnow
(global-set-key (kbd "C-M-l") 'windmove-right) ; move to right window
(global-set-key (kbd "C-M-k") 'windmove-up) ; move to upper window
(global-set-key (kbd "C-M-j") 'windmove-down) ; move to downer window

(add-hook 'c-mode-hook 'stk-unset-hjkl-keys)
(add-hook 'c++-mode-hook 'stk-unset-hjkl-keys)
(add-hook 'paredit-mode-hook 'stk-unset-hjkl-keys)
(add-hook 'ibuffer-mode-hook 'stk-unset-hjkl-keys)
(add-hook 'magit-mode-hook 'stk-unset-hjkl-keys)
