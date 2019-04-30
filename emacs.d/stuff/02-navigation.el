(use-package window-numbering
  :config
  (window-numbering-mode t))

(defun ml-smart-beginning-of-line ()
  (interactive)

  (let ((saved-point (point)))
    (beginning-of-line-text)
    (if (= saved-point (point)) (beginning-of-line))))

(global-set-key (kbd "C-a") 'ml-smart-beginning-of-line)

(defun ml-unset-hjkl-keys ()
  (let ((keys '("M-l" "M-h"
                "M-k" "M-j"
                "M-L" "M-H"
                "M-K" "M-J")))
    (dolist (k keys)
      (define-key (current-local-map) (kbd k) nil))))

(defun ml-remap-movement-keys (keymap)
  (let ((mappings '(("C-f" . "M-l")
                    ("C-b" . "M-h")
                    ("C-p" . "M-k")
                    ("C-n" . "M-j")
                    ("M-f" . "M-L")
                    ("M-b" . "M-H"))))

    (dolist (mapping mappings)
      (define-key keymap
        (kbd (cdr mapping))
        (lookup-key keymap (kbd (car mapping))))))

  (define-key keymap (kbd "M-J") (lambda () (interactive) (next-line 5)))
  (define-key keymap (kbd "M-K") (lambda () (interactive) (next-line -5))))

(ml-remap-movement-keys (current-global-map))

;; unset HJKL keys in special modes
(dolist (hook '(c-mode-hook
                c++-mode-hook
                ibuffer-mode-hook
                smartparens-mode-hook
                magit-mode-hook
                xml-mode-hook
                nxml-mode-hook
                js2-mode-hook))
  (add-hook hook 'ml-unset-hjkl-keys))
