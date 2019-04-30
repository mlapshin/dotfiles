(use-package company
  :config
  (global-company-mode 1)

  :bind (:map company-active-map
              ("M-j" . company-select-next)
              ("M-k" . company-select-previous)))
