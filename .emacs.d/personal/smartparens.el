(require 'smartparens-config)

(define-key sp-keymap (kbd "C-M-k") 'sp-kill-sexp)
(define-key sp-keymap (kbd "C-M-w") 'sp-copy-sexp)
(define-key sp-keymap (kbd "ESC <deletechar>") 'sp-unwrap-sexp) ;; M-delete

(define-key sp-keymap (kbd "M-[ d") 'sp-forward-slurp-sexp)
(define-key sp-keymap (kbd "M-[ c") 'sp-forward-barf-sexp)

(define-key sp-keymap (kbd "C-M-l") 'sp-add-to-previous-sexp)
(define-key sp-keymap (kbd "C-M-h") 'sp-add-to-next-sexp)
(define-key sp-keymap (kbd "C-c j") 'sp-join-sexp)
(define-key sp-keymap (kbd "C-c s") 'sp-split-sexp)
(define-key sp-keymap (kbd "C-c d") 'sp-splice-sexp-killing-around)
