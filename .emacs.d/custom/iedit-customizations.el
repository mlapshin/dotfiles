(add-to-list 'load-path "~/.emacs.d/vendor/iedit")

(require 'iedit)

(global-set-key (kbd "C-.") 'iedit-mode)
(global-set-key (kbd "C-c .") 'iedit-mode)


