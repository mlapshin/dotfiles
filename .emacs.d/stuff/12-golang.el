(use-package go-mode)

(use-package lsp-mode
  :config
  (require 'lsp-clients)

  (setq lsp-enable-snippet nil
	lsp-print-io 't)

  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection
				     (lambda () (cons "/Users/mlapshin/work/go/bin/gopls" lsp-gopls-server-args)))
		    :major-modes '(go-mode)
		    :priority +1
		    :server-id 'gopls
		    :library-folders-fn (lambda (_workspace)
					  lsp-clients-go-library-directories)))

  :hook (go-mode . lsp)
  :commands lsp)

(use-package go-eldoc)
(use-package company-lsp
  :config
  (require 'company-lsp)
  (push 'company-lsp company-backends))

;; (setq company-go-gocode-command "/Users/mlapshin/work/go/bin/gocode")
(setq go-eldoc-gocode "/Users/mlapshin/work/go/bin/gocode")
(setq gofmt-command "/usr/local/bin/gofmt")

(with-eval-after-load 'go-mode
  (defun ml-go-mode-defaults ()
    ;; Add to default go-mode key bindings
    (let ((map go-mode-map))
      (define-key map (kbd "C-c a") 'go-test-current-project) ;; current package, really
      (define-key map (kbd "C-c m") 'go-test-current-file)
      (define-key map (kbd "C-c .") 'go-test-current-test)
      (define-key map (kbd "C-c b") 'go-run)
      (define-key map (kbd "C-h f") 'godoc-at-point))

    ;; Prefer goimports to gofmt if installed
    (let ((goimports (executable-find "goimports")))
      (when goimports
	(setq gofmt-command goimports)))

    ;; gofmt on save
    (add-hook 'before-save-hook 'gofmt-before-save nil t)

    ;; stop whitespace being highlighted
    ;; (whitespace-toggle-options '(tabs))

    ;; Company mode settings
    ;; (set (make-local-variable 'company-backends) '(company-go))

    ;; El-doc for Go
    (go-eldoc-setup)

    ;; CamelCase aware editing operations
    (subword-mode +1))

  (add-hook 'go-mode-hook 'ml-go-mode-defaults))
