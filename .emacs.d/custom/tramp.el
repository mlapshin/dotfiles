;; tramp, for sudo access
(require 'tramp)

;; keep in mind known issues with zsh - see emacs wiki
(setq tramp-default-method "ssh")
