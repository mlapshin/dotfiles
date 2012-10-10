(defun esk-run-coding-hook ())

(eval-after-load 'ruby-mode
  '(progn
     (rvm-use-default)

     (remove-hook 'ruby-mode-hook 'esk-paredit-nonlisp)

     (add-hook 'ruby-mode-hook
               (lambda ()
                 (ruby-electric-mode t)
                 ;; (define-key ruby-mode-map (kbd "C-j") 'newline)
                 (flymake-ruby-load)
                 (paredit-mode 0)
                 (flymake-mode t)
                 (wrap-region-mode t)
                 (define-key ruby-mode-map (kbd "C-j") 'newline)
                 (define-key ruby-mode-map "\e\C-a" nil)
                 (define-key ruby-mode-map "\e\C-h" nil)
                 (define-key ruby-mode-map (kbd "C-M-h") nil)))))
