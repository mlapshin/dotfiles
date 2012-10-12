(add-hook 'ido-setup-hook 'ido-my-keys)

(defun ido-my-keys ()
  "Add my keybindings for ido."
  (define-key ido-completion-map (kbd "<tab>") 'ido-exit-minibuffer)
  (define-key ido-completion-map (kbd "M-l") 'ido-next-match)
  (define-key ido-completion-map (kbd "M-h") 'ido-prev-match)
  (define-key ido-completion-map (kbd "M-j") 'ido-next-match)
  (define-key ido-completion-map (kbd "M-k") 'ido-prev-match))
