(require 'dired)
(require 'dired-details)
(require 'dired-single)

(add-hook 'dired-mode-hook (lambda()
                             ;; Bunch of stuff to run for dired, either immediately or when it's loaded.
                             (define-key dired-mode-map (kbd "RET") 'dired-single-buffer)
                             (define-key dired-mode-map [mouse-1] 'dired-single-buffer-mouse)
                             (define-key dired-mode-map (kbd "C-q") 'wdired-change-to-wdired-mode)
                             (define-key dired-mode-map (kbd "C-d") 'dired-details-toggle)
                             (define-key dired-mode-map "^"
                               (function
                                (lambda nil (interactive) (dired-single-buffer ".."))))))

(global-set-key [(f8)] (function
                                (lambda nil (interactive)
                                  (dired-single-magic-buffer default-directory))))
