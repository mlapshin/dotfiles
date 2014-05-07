(require 'ac-nrepl)
(require 'smartparens-config)
(require 'cider-mode)

(define-key emacs-lisp-mode-map (kbd "<f5>") (lambda ()
                                               (interactive)
                                               (eval-buffer)
                                               (message "eval-buffer")))

(defun elisp-pp (sexp)
  (with-output-to-temp-buffer "*Pp Eval Output*"
    (pp sexp)
    (with-current-buffer standard-output
      (emacs-lisp-mode))))

(defun cider-repl-reset ()
  (interactive)
  (cider-ensure-connected)
  (save-some-buffers)
  (set-buffer (cider-find-or-create-repl-buffer))
  (goto-char (point-max))
  (insert "(user/reset)")
  (cider-repl-return))

(defun trun-on-smartparens-mode ()
  (smartparens-mode t)
  (smartparens-strict-mode t))

(add-hook 'clojure-mode-hook 'trun-on-smartparens-mode)

(add-hook 'emacs-lisp-mode-hook 'trun-on-smartparens-mode)
(add-hook 'lisp-interaction-mode-hook 'trun-on-smartparens-mode)

(add-hook 'cider-repl-mode-hook
          (lambda ()
            (define-key cider-repl-mode-map (kbd "C-c r") 'cider-repl-reset)
            (turn-on-smartparens-mode)
            (auto-complete-mode t)))

(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)

(add-hook 'cider-repl-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)

(define-key sp-keymap (kbd "C-M-k") 'sp-kill-sexp)
(define-key sp-keymap (kbd "M-(") (lambda () (interactive) (insert-parentheses 1))) ;; like paredit
(define-key sp-keymap (kbd "C-M-w") 'sp-copy-sexp)
(define-key sp-keymap (kbd "ESC <deletechar>") 'sp-unwrap-sexp) ;; M-delete

(define-key sp-keymap (kbd "M-[ d") 'sp-forward-slurp-sexp)
(define-key sp-keymap (kbd "M-[ c") 'sp-forward-barf-sexp)

(define-key sp-keymap (kbd "C-M-l") 'sp-add-to-previous-sexp)
(define-key sp-keymap (kbd "C-M-h") 'sp-add-to-next-sexp)
(define-key sp-keymap (kbd "C-c j") 'sp-join-sexp)
(define-key sp-keymap (kbd "C-c s") 'sp-split-sexp)
(define-key sp-keymap (kbd "C-c d") 'sp-splice-sexp-killing-around)

(define-key cider-mode-map (kbd "C-c r") 'cider-repl-reset)
