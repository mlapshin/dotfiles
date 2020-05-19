(use-package smartparens
  :config
  (require 'smartparens-config)

  (show-smartparens-global-mode t)
  (smartparens-global-mode +1)

  (define-key smartparens-mode-map (kbd "C-M-k") 'sp-kill-sexp)
  (define-key smartparens-mode-map (kbd "C-M-w") 'sp-copy-sexp)

  (define-key smartparens-mode-map (kbd "C-M-l") 'sp-add-to-previous-sexp)
  (define-key smartparens-mode-map (kbd "C-M-h") 'sp-add-to-next-sexp)
  (define-key smartparens-mode-map (kbd "C-c j") 'sp-join-sexp)

  (define-key smartparens-mode-map (kbd "M-s") 'sp-splice-sexp)

  (define-key smartparens-mode-map (kbd "C-M-a") 'sp-beginning-of-sexp)
  (define-key smartparens-mode-map (kbd "C-M-e") 'sp-end-of-sexp)

  (define-key smartparens-mode-map (kbd "C-b") 'sp-select-next-thing)
  (define-key smartparens-mode-map (kbd "M-r") 'sp-splice-sexp-killing-around)

  (define-key smartparens-mode-map (kbd "M-(") (lambda ()
                                                 (interactive)
                                                 (sp-wrap-with-pair "(")))

  (define-key smartparens-mode-map (kbd "M-{") (lambda ()
                                                 (interactive)
                                                 (sp-wrap-with-pair "{")))

  (define-key smartparens-mode-map (kbd "M-[") (lambda ()
                                                 (interactive)
                                                 (sp-wrap-with-pair "[")))

  (set-face-foreground 'sp-show-pair-match-face "white")

  (add-hook 'clojure-mode-hook (lambda ()
                                 (smartparens-strict-mode +1)))

  (add-hook 'elisp-mode-hook (lambda ()
                               (smartparens-strict-mode +1))))

(use-package rainbow-delimiters
  :config

  (add-hook 'elisp-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode))
