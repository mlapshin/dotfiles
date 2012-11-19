(require 'package)
(add-to-list 'package-archives '("elpa" .      "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("gnu" .       "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'load-path "~/.emacs.d/vendor")

(require 'hippie-exp)

;; Do not initialize packages for now
(package-initialize t)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-package-load-list '(rainbow-mode
                               ido-yes-or-no maxframe color-theme inf-ruby ruby-mode rvm
                               flymake-ruby hl-line+ dired-single dired-details
                               haml-mode magit markdown-mode sass-mode
                               yaml-mode fuzzy popup ruby-end ruby-block rspec-mode ruby-tools
                               starter-kit-ruby starter-kit rinari wrap-region
                               auto-indent-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-package-load-list)
  (when (not (package-installed-p p))
    (package-install p)))

(dolist (p my-package-load-list)
  (let ((version (package-desc-vers (cdr (assq p package-alist)))))
    (package-activate p version)))

(setq custom-file "~/.emacs.d/sotakone-custom-variables.el")
(load custom-file)

(put 'downcase-region 'disabled nil)
(server-start)
