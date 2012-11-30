(require 'treetop)

(defun esk-run-coding-hook ())

(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.treetop$" . treetop-mode))

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
     (require 'rspec-mode)

     (rvm-use-default)

     (remove-hook 'ruby-mode-hook 'esk-paredit-nonlisp)

     (add-hook 'rspec-mode-hook (lambda ()
                                  (flymake-mode -1)))

     (add-hook 'ruby-mode-hook
               (lambda ()
                 (ruby-tools-mode t)

                 (ruby-block-mode t)
                 (ruby-block-highlight-toggle)

                 (add-hook 'before-save-hook 'whitespace-cleanup)

                 (flymake-ruby-load)
                 (paredit-mode 0)
                 (flymake-mode t)
                 (wrap-region-mode t)
                 (subword-mode t)
                 (define-key ruby-mode-map (kbd "C-j") 'newline)
                 (define-key ruby-mode-map (kbd "C-M-i") 'imenu)
                 (define-key ruby-mode-map (kbd "C-c , ,") 'senny-ruby-open-spec-other-buffer)))))

