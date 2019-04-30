(use-package ivy
  :init
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))

  :config

  (use-package counsel)
  (ivy-mode 1)

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
