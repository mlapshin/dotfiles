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

(defvar my-package-load-list '(rainbow-mode smooth-scrolling git-gutter
                               ido-yes-or-no maxframe color-theme inf-ruby ruby-mode rvm
                               flymake-ruby hl-line+ dired-single dired-details
                               magit markdown-mode sass-mode  ace-jump-mode wrap-region
                               yaml-mode fuzzy popup ruby-end ruby-block rspec-mode ruby-tools slim-mode
                               rinari
                               starter-kit-ruby starter-kit)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-package-load-list)
  (when (not (package-installed-p p))
    (package-install p)))

(dolist (p my-package-load-list)
  (let ((version (package-desc-vers (cdr (assq p package-alist)))))
    (package-activate p version)))

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
