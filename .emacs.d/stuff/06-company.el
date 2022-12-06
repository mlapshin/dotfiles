(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-backends '((company-capf)))

  :bind (:map company-active-map
              ("M-j" . company-select-next)
              ("M-k" . company-select-previous)))
