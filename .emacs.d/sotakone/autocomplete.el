(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/vendor/auto-complete/ac-dict")

(add-to-list 'auto-mode-alist '("\\.yasnippet$" . snippet-mode))

;; JK keys in AC menu
(define-key ac-menu-map (kbd "M-k") 'ac-previous)
(define-key ac-menu-map (kbd "M-j") 'ac-next)
(define-key ac-menu-map (kbd "<tab>") 'ac-expand)

(defun indent-or-autocomplete ()
  "Tries to expand snippet at point, then tries to display autocomplete menu.
If we have nothing to expand or autocomplete, just indent current line like
regular TAB."
  (interactive)
  (let ((yas-expand-result (yas/expand)))
    (if (eql yas-expand-result nil)
        (progn
          (auto-complete)
          (if (eql ac-triggered nil)
              (indent-for-tab-command))))))

(define-key ac-mode-map (kbd "<tab>") 'indent-or-autocomplete)
(define-key ac-mode-map (kbd "C-<tab>") 'indent-for-tab-command)

(defun ac-common-setup ()
  (add-to-list 'ac-sources 'ac-source-yasnippet))

(ac-config-default)
