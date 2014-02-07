(defun cycle-ansi-term ()
  "cycle through buffers whose major mode is term-mode"
  (interactive)
  (when (string= "term-mode" major-mode)
    (bury-buffer))
  (let ((buffers (cdr (buffer-list))))
    (while buffers
      (when (with-current-buffer (car buffers) (string= "term-mode" major-mode))
        (switch-to-buffer (car buffers))
        (setq buffers nil))
      (setq buffers (cdr buffers)))))

(global-set-key (kbd "<f1>") 'cycle-ansi-term)

(defun toggle-show-trailing-whitespace ()
  (interactive)
  (setq show-trailing-whitespace (not show-trailing-whitespace)))

(eval-after-load 'comint
  '(progn
     (define-key comint-mode-map (kbd "C-M-l") 'windmove-right)

     (add-hook 'comint-mode-hook (lambda ()
                                   (toggle-show-trailing-whitespace)))

     (add-hook 'term-mode-hook (lambda ()
                                 (toggle-show-trailing-whitespace)))))
