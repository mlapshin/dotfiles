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
                magit-mode-hook
                nxml-mode-hook))
  (add-hook hook 'ml-unset-hjkl-keys))

;; HJKL for ido
(add-hook 'ido-setup-hook
          (lambda ()
            (define-key ido-completion-map (kbd "<tab>") 'ido-exit-minibuffer)
            (define-key ido-completion-map (kbd "M-l") 'ido-next-match)
            (define-key ido-completion-map (kbd "M-h") 'ido-prev-match)
            (define-key ido-completion-map (kbd "M-j") 'ido-next-match)
            (define-key ido-completion-map (kbd "M-k") 'ido-prev-match)))

(eval-after-load 'browse-kill-ring
  '(progn
     (define-key browse-kill-ring-mode-map (kbd "M-j") 'browse-kill-ring-forward)
     (define-key browse-kill-ring-mode-map (kbd "M-k") 'browse-kill-ring-previous)))

(eval-after-load 'grizzl-read
  '(progn
     (define-key *grizzl-keymap* (kbd "M-k") 'grizzl-set-selection+1)
     (define-key *grizzl-keymap* (kbd "M-K") (lambda () (interactive) (grizzl-move-selection +5)))
     (define-key *grizzl-keymap* (kbd "M-j") 'grizzl-set-selection-1)
     (define-key *grizzl-keymap* (kbd "M-J") (lambda () (interactive) (grizzl-move-selection -5)))))
