(autoload 'yaml-mode "yaml-mode" "Edit YAML documents" t)

(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
