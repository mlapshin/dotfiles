(defun ml-kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

(define-key global-map (kbd "C-x C-k") 'ml-kill-current-buffer)

(use-package ibuffer
  :bind (("C-x C-b" . ibuffer)))

(use-package ibuffer-vc
  :after (ibuffer)

  :config
  (add-hook 'ibuffer-hook
            (lambda ()
              (ibuffer-vc-set-filter-groups-by-vc-root)
              (unless (eq ibuffer-sorting-mode 'alphabetic)
                (ibuffer-do-sort-by-alphabetic)))))
