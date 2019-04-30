(use-package smartparens
  :config
  (require 'smartparens-config)

  (define-key sp-keymap (kbd "C-M-k") 'sp-kill-sexp)
  (define-key sp-keymap (kbd "C-M-w") 'sp-copy-sexp)

  (define-key sp-keymap (kbd "C-M-l") 'sp-add-to-previous-sexp)
  (define-key sp-keymap (kbd "C-M-h") 'sp-add-to-next-sexp)
  (define-key sp-keymap (kbd "C-c j") 'sp-join-sexp)

  (define-key sp-keymap (kbd "C-M-a") 'sp-beginning-of-sexp)
  (define-key sp-keymap (kbd "C-M-e") 'sp-end-of-sexp)

  (define-key sp-keymap (kbd "M-{") (lambda ()
                                      (interactive)
                                      (sp-wrap-with-pair "{")))

  (define-key sp-keymap (kbd "M-[") (lambda ()
                                      (interactive)
                                      (sp-wrap-with-pair "["))))
