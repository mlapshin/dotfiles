(require 'dired)
(require 'dired-details)
(require 'dired-single)

;; Dired-single keybindings
(defun my-dired-init ()
  "Bunch of stuff to run for dired, either immediately or when it's loaded."
  (define-key dired-mode-map [return] 'dired-single-buffer)
  (define-key dired-mode-map [mouse-1] 'dired-single-buffer-mouse)
  (define-key dired-mode-map (kbd "C-q") 'wdired-change-to-wdired-mode)
  (define-key dired-mode-map (kbd "C-d") 'dired-details-toggle)
  (define-key dired-mode-map "^"
    (function
     (lambda nil (interactive) (dired-single-buffer "..")))))

;; if dired's already loaded, then the keymap will be bound
(if (boundp 'dired-mode-map)
    ;; we're good to go; just add our bindings
    (my-dired-init)
  ;; it's not loaded yet, so add our bindings to the load-hook
  (add-hook 'dired-load-hook 'my-dired-init))

(global-set-key [(f8)] 'dired-single-magic-buffer)

(global-set-key [(control f8)] (function
                                (lambda nil (interactive)
                                  (dired-single-magic-buffer default-directory))))

(global-set-key [(shift f8)] (function
                              (lambda nil (interactive)
                                (message "Current directory is: %s" default-directory))))

(global-set-key [(meta f8)] 'dired-single-toggle-buffer-name)
;; End of dired-single keybindings
