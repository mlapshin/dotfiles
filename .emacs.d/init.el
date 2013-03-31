(add-to-list 'load-path "~/.emacs.d/vendor")

(require 'package)
(package-initialize)

(mapc 'load (directory-files
             (concat user-emacs-directory "custom") t "^[^#].*el$"))

(setq custom-file "~/.emacs.d/sotakone-custom-variables.el")
(load custom-file)

(server-start)

(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)

;; C-z should be rebinded at the end of initialization
(require 'ace-jump-mode)

(global-set-key (kbd "C-z") 'ace-jump-mode)
(global-set-key (kbd "C-M-z") 'ace-jump-char-mode)
