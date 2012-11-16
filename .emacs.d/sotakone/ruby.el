(defun esk-run-coding-hook ())

(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))

(defun senny-ruby-open-spec-other-buffer ()
  (interactive)
  (when (featurep 'rspec-mode)
    (let ((source-buffer (current-buffer))
          (other-buffer (progn
                          (rspec-toggle-spec-and-target)
                          (current-buffer))))
      (switch-to-buffer source-buffer)
      (pop-to-buffer other-buffer))))

(eval-after-load 'ruby-mode
  '(progn
     (require 'ruby-end)
     (require 'ruby-block)
     (require 'ruby-tools)

     (rvm-use-default)

     (remove-hook 'ruby-mode-hook 'esk-paredit-nonlisp)

     (add-hook 'ruby-mode-hook
               (lambda ()
                 (ruby-tools-mode t)

                 (electric-pair-mode t)
                 (electric-indent-mode t)
                 (electric-layout-mode t)

                 (ruby-block-mode t)
                 (ruby-block-highlight-toggle)

                 (add-hook 'before-save-hook 'whitespace-cleanup)

                 ;; (define-key ruby-mode-map (kbd "C-j") 'newline)
                 (flymake-ruby-load)
                 (paredit-mode 0)
                 (flymake-mode t)
                 (wrap-region-mode t)
                 (define-key ruby-mode-map (kbd "C-j") 'newline)
                 (define-key ruby-mode-map (kbd "C-c , ,") 'senny-ruby-open-spec-other-buffer)))))

(add-hook 'haml-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (define-key haml-mode-map "\C-m" 'newline-and-indent)))
