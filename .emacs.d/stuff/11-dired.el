(use-package dired-single
  :config
  (require 'dired)
  (require 'dired-single)

  (add-hook 'dired-mode-hook
	    (lambda()
	      ;; single-buffer dired
	      (define-key dired-mode-map (kbd "RET") 'dired-single-buffer)
	      (define-key dired-mode-map [mouse-1] 'dired-single-buffer-mouse)
	      (define-key dired-mode-map "^"
		(lambda nil (interactive) (dired-single-buffer ".."))))))
