(require 'cask "~/.cask/cask.el")
(cask-initialize)

(add-to-list 'load-path "~/.emacs.d/vendor")

(mapc 'load (directory-files
             (concat user-emacs-directory "custom") t "^[^#].*el$"))

(require 'flymake-cursor)

(setq custom-file "~/.emacs.d/sotakone-custom-variables.el")
(load custom-file)

(server-start)

(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)

;;; increase GC threshold for grizzl
(setq gc-cons-threshold 20000000)
(put 'erase-buffer 'disabled nil)
