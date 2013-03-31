(add-hook 'after-init-hook (lambda ()
                            ;; C-z should be rebinded at the end of initialization
                            (require 'ace-jump-mode)

                            (global-set-key (kbd "C-z") 'ace-jump-mode)
                            (global-set-key (kbd "C-M-z") 'ace-jump-char-mode)))
