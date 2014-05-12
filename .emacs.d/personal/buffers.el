(prelude-require-packages '(ibuffer ibuffer-vc))

(defun ml-kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-vc-set-filter-groups-by-vc-root)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))

(global-set-key (kbd "C-x C-b") 'ibuffer)
(define-key global-map (kbd "C-x C-k") 'ml-kill-current-buffer)
