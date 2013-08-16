(add-to-list 'load-path "~/.emacs.d/vendor")

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(add-to-list 'load-path "~/.emacs.d/vendor/helm")

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
