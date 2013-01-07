(add-to-list 'load-path "~/.emacs.d/vendor/expand-region/")
(require 'expand-region)

(global-set-key (kbd "C-b") 'er/expand-region)

(eval-after-load 'ruby-mode
  '(progn
     (add-hook 'ruby-mode-hook (lambda ()
                                 (define-key ruby-mode-map (kbd "C-M-u") 'er/ruby-backward-up)
                                 (define-key ruby-mode-map (kbd "C-M-d") 'er/ruby-forward-up)))))
