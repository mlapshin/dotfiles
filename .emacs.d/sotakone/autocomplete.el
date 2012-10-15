(add-to-list 'load-path "~/.emacs.d/vendor/auto-complete/")
(add-to-list 'load-path "~/.emacs.d/vendor/yasnippet/")

(require 'yasnippet)
(require 'auto-complete)
(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/vendor/auto-complete/dict")

(add-to-list 'auto-mode-alist '("\\.yasnippet$" . snippet-mode))

;; JK keys in AC menu
(define-key ac-menu-map (kbd "M-k") 'ac-previous)
(define-key ac-menu-map (kbd "M-j") 'ac-next)
(define-key ac-menu-map (kbd "<tab>") 'ac-expand)

(defun indent-or-autocomplete ()
  "Tries to display autocomplete menu. If we have
nothing to expand or autocomplete, just indent current line like regular TAB."
  (interactive)
  (auto-complete)
  (if (eql ac-triggered nil)
      (indent-for-tab-command)))

(define-key ac-mode-map (kbd "<tab>") 'indent-or-autocomplete)
(define-key ac-mode-map (kbd "C-<tab>") 'indent-for-tab-command)

(defface ac-etags-candidate-face
  '((t (:background "gainsboro" :foreground "deep sky blue")))
  "Face for etags candidate")

(defface ac-etags-selection-face
  '((t (:background "deep sky blue" :foreground "white")))
  "Face for the etags selected candidate.")

(defvar ac-source-etags
  '((candidates . (lambda ()
                    (if tags-table-list
                        (all-completions ac-target (tags-completion-table))
                      )))
    (candidate-face . ac-etags-candidate-face)
    (selection-face . ac-etags-selection-face)
    (requires . 3))
  "Source for etags.")

(defun ac-common-setup ()
  (add-to-list 'ac-sources 'ac-source-yasnippet)
  (add-to-list 'ac-sources 'ac-source-etags))

(ac-config-default)
