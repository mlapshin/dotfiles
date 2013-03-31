;;(add-to-list 'load-path "~/.emacs.d/vendor/auto-complete/")
;;(add-to-list 'load-path "~/.emacs.d/vendor/yasnippet/")

;;(require 'yasnippet)
(require 'auto-complete)
(require 'auto-complete-config)

;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/vendor/auto-complete/dict")
;;(add-to-list 'auto-mode-alist '("\\.yasnippet$" . snippet-mode))

(global-set-key (kbd "M-/") 'auto-complete)

(defface ac-etags-candidate-face
  '((t (:background "gainsboro" :foreground "deep sky blue")))
  "Face for etags candidate")

(defface ac-etags-selection-face
  '((t (:background "deep sky blue" :foreground "white")))
  "Face for the etags selected candidate.")

(ac-define-source etags
  '((candidates . (lambda ()
                    (if tags-table-list
                        (all-completions ac-target (tags-completion-table))
                      nil)))

    (candidate-face . ac-etags-candidate-face)
    (selection-face . ac-etags-selection-face)
    (symbol . "t")
    (requires . 3)))


;; JK keys in AC menu
(define-key ac-menu-map (kbd "M-k") 'ac-previous)
(define-key ac-menu-map (kbd "M-j") 'ac-next)
(define-key ac-menu-map (kbd "C-s") 'ac-isearch)
(define-key ac-menu-map [return] 'ac-complete)

;; (define-key ac-completing-map (kbd "<tab>") 'ac-complete)

;; (define-key ac-mode-map (kbd "C-<tab>") 'indent-for-tab-command)

(defun ac-common-setup ()
  ;;(add-to-list 'ac-sources 'ac-source-yasnippet)
  (add-to-list 'ac-sources 'ac-source-etags))

(ac-config-default)
