(define-key emacs-lisp-mode-map (kbd "<f5>") (lambda ()
                                               (interactive)
                                               (eval-buffer)
                                               (message "eval-buffer")))

(defun elisp-pp (sexp)
  (with-output-to-temp-buffer "*Pp Eval Output*"
    (pp sexp)
    (with-current-buffer standard-output
      (emacs-lisp-mode))))

;; (add-hook 'emacs-lisp-mode-hook
;;           (lambda ()
;;             (paredit-mode t)))
