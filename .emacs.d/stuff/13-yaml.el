(defun ml-disable-sp ()
  (smartparens-mode -1))

(use-package yaml-mode
  :config
  (require 'yaml-mode)
  (require 'yaml-path)

  (add-hook 'yaml-mode-hook 'ml-disable-sp)
  
  :bind (:map yaml-mode-map
              ("C-c C-p" . yaml-path/path)
              ("DEL" . backward-delete-char-untabify)
              ("C-w" . backward-kill-word-or-region)))
