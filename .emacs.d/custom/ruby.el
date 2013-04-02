(require 'treetop)

(defun esk-run-coding-hook ())

(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.treetop$" . treetop-mode))

(defun narrow-to-ruby-def ()
  "Narrow buffer to the current Ruby function."
  (interactive)

  (save-excursion
      (condition-case nil
          (forward-char 3)
        (error nil))

      (word-search-backward "def")
      (while (er--point-inside-string-p)
        (word-search-backward "def"))
      (beginning-of-line)
      (set-mark (point))
      (er/ruby-end-of-block)
      (end-of-line)
      (narrow-to-region (mark) (point))))

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

     (defadvice ruby-indent-line (after line-up-args activate)
       (let (indent prev-indent arg-indent)
         (save-excursion
           (back-to-indentation)
           (when (zerop (car (syntax-ppss)))
             (setq indent (current-column))
             (skip-chars-backward " \t\n")
             (when (eq ?, (char-before))
               (ruby-backward-sexp)
               (back-to-indentation)
               (setq prev-indent (current-column))
               (skip-syntax-forward "w_.")
               (skip-chars-forward " ")
               (setq arg-indent (current-column)))))
         (when prev-indent
           (let ((offset (- (current-column) indent)))
             (cond ((< indent prev-indent)
                    (indent-line-to prev-indent))
                   ((= indent prev-indent)
                    (indent-line-to arg-indent)))
             (when (> offset 0) (forward-char offset))))))

     (idle-highlight-mode t)
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
                 (define-key ruby-mode-map (kbd "C-n C-d") 'narrow-to-ruby-def)
                 (define-key ruby-mode-map (kbd "C-j") 'newline)
                 (define-key ruby-mode-map (kbd "C-c , ,") 'senny-ruby-open-spec-other-buffer)
                 (define-key ruby-mode-map (kbd "C-M-h") nil)
                 (stk-unset-hjkl-keys)))))

