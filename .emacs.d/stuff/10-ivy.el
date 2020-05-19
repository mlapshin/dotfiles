(use-package ivy
  :config

  (use-package counsel)
  (use-package flx)

  (require 'flx)
  (ivy-mode 1)

  (setq-default ivy-use-virtual-buffers t)
  (setq-default ivy-re-builders-alist '((t . ivy--regex-plus)))

  :bind (("C-s" . swiper)
         ("M-x" . counsel-M-x)
         ("C-x C-r" . counsel-ag)
         ("C-x b" . ivy-switch-buffer)
         ("C-x C-f" . counsel-find-file)
         ("C-x C-p" . counsel-git)
         :map ivy-minibuffer-map
         ("M-j" . ivy-next-line)
         ("M-k" . ivy-previous-line)
         ("M-w" . ivy-yank-word)
         ("RET" . ivy-alt-done)
         ("C-w" . ivy-backward-kill-word)))
