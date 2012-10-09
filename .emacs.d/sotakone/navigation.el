(eval-after-load "paredit"
  '(progn
     (define-key paredit-mode-map (kbd "M-J") nil)))

(eval-after-load "ibuffer"
  '(progn
     (define-key ibuffer-mode-map (kbd "M-j") nil)))

(eval-after-load "cc"
  '(progn
     (define-key c-mode-map    "\e\C-h" nil)
     (define-key c-mode-map    "\e\C-j" nil)
     (define-key c-mode-map    "\M-j"   nil)
     (define-key c++-mode-map  "\e\C-h" nil)
     (define-key c++-mode-map  "\e\C-j" nil)
     (define-key c++-mode-map  "\M-j"   nil)))

(defun smart-beginning-of-line ()
  (interactive)

  (let ((saved-point (point)))
    (beginning-of-line-text)
    (message "Saved point %s, current point %s" saved-point (point))
    (if (= saved-point (point))
       (beginning-of-line))))

(add-hook 'after-init-hook
          (lambda ()
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
            ))
