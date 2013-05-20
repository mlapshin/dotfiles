(require 'popwin)
(require 'find-file-in-project)

(defun elisp-pp (sexp)
  (with-output-to-temp-buffer "*Pp Eval Output*"
    (pp sexp)
    (with-current-buffer standard-output
      (emacs-lisp-mode))))

(defgroup command-t nil
  "Visit file with typing only path and name abbreviations."
  :group 'find-file
  :prefix "command-t-")

(defcustom command-t-matches-window-height 11
  "Height of popup window with matched file paths."
  :type 'integer
  :group 'command-t)

(defface command-t-selected-match-face
  '((t (:foreground "white" :background "black")))
  "Face for selected matching file in popup window"
  :group 'command-t)

(defface command-t-header-face
  '((t (:inherit mode-line :underline t)))
  "Face for selected matching file in popup window"
  :group 'command-t)

(defvar command-t-matches-window nil
  "Popup window")

(defvar command-t-matches-buffer nil
  "Buffer with matches")

(defvar command-t-minibuffer-map nil
  "Keymap used in minubuffer")

(defvar command-t-matches-buffer-map nil
  "Keymap used in matches buffer")

(defun command-t-mode (&optional arg)
  "Enable or disable Command-T mode"

  (interactive "P")
  (setq command-t-mode (cond
                        ((null arg) (if command-t-mode nil t))
                        ((> (prefix-numeric-value arg) 0) t)
                        (t nil)))

  (when (called-interactively-p 'any)
    (message "Command-T mode %s" (if command-t-mode "enabled" "disabled"))))

(defun command-t-redraw-matches-buffer ()
  (set-buffer command-t-matches-buffer)
  (setq buffer-read-only nil)
  (erase-buffer)

  (let ((header-line (format "Command-T: %d files matched\n" (length command-t-matches))))
    (insert (propertize header-line 'face 'command-t-header-face)))

  (dotimes (match-index (length command-t-matches))
    (let ((match-line (format "%s\n"
                              (cdr (nth match-index command-t-matches)))))
      (insert match-line)))

  (setq buffer-read-only t)
  (command-t-set-selected-match 0))

(defun command-t-set-selected-match (match-index)
  (set-buffer command-t-matches-buffer)

  (save-selected-window
    (select-window (cadr command-t-matches-window))
    (set 'command-t-selected-match-index match-index)

    (goto-char (point-min))
    (forward-line (+ 1 match-index))

    (move-overlay command-t-selected-match-overlay
                  (line-beginning-position)
                  (+ 1 (line-end-position)))))

(defun command-t-previous-match (&optional arg)
  "Previous match"
  (interactive "p")
  (set-buffer command-t-matches-buffer)
  (command-t-set-selected-match (max (- command-t-selected-match-index arg) 0)))

(defun command-t-next-match (&optional arg)
  "Next match"
  (interactive "p")
  (set-buffer command-t-matches-buffer)
  (command-t-set-selected-match (min (+ command-t-selected-match-index arg)
                                     (- (length command-t-matches) 1))))

(defun command-t-minibuffer-changed-handler (start end old-len)
  (command-t-update-matches (minibuffer-contents)))

(defun command-t-ffip-find-command ()
  (format "find %s -type f \\( %s \\) %s | head -n %s"
          (ffip-project-root) (ffip-join-patterns) ffip-find-options ffip-limit))

(defun command-t-update-matches (lookup-string)
  (set-buffer command-t-matches-buffer)

  (setq command-t-matches
       (mapcar (lambda (path)
                 (cons path (substring path (length "/home/mlapshin/dotfiles/"))))
               (delete "" (split-string (shell-command-to-string (format "find /home/mlapshin/dotfiles -name *%s*"
                                                                         lookup-string)) "\n"))))

  (command-t-redraw-matches-buffer))

(defun command-t-minibuffer-setup-handler ()
  (add-hook 'after-change-functions 'command-t-minibuffer-changed-handler nil t)
  (add-hook 'minibuffer-exit-hook 'command-t-minibuffer-exit-handler nil t))

(defun command-t-halt ()
  (interactive)
  (abort-recursive-edit))

(defun command-t-cleanup ()
  (kill-buffer command-t-matches-buffer)
  (setq command-t-matches-buffer nil)
  (setq command-t-matches-window nil))

(defun command-t-minibuffer-exit-handler ()
  )

(defun command-t-create-matches-buffer ()
  (setq command-t-matches-buffer (get-buffer-create "*command-t-matches*"))
  (set-buffer command-t-matches-buffer)
  (use-local-map command-t-matches-buffer-map)

  ;; create buffer-local variable wich holds selected match index
  (set (make-local-variable 'command-t-selected-match-index) 0)
  (set (make-local-variable 'command-t-matches) '())

  (make-local-variable 'smooth-scroll-margin)
  (make-local-variable 'scroll-margin)

  (setq smooth-scroll-margin 1)
  (setq scroll-margin 1)

  (set (make-local-variable 'command-t-selected-match-overlay) (make-overlay 1 1))
  (overlay-put command-t-selected-match-overlay 'face 'command-t-selected-match-face)

  (make-local-variable 'mode-line-format)
  (setq mode-line-format nil)
  (setq show-trailing-whitespace nil))

(defun command-t-find-file (&optional arg)
  "Finds file using fuzzy matching."

  (interactive "p")

  (command-t-create-matches-buffer)

  (when t ;;(null command-t-minibuffer-map)
    (setq command-t-minibuffer-map (make-sparse-keymap))
    (define-key command-t-minibuffer-map (kbd "<up>") 'command-t-previous-match)
    (define-key command-t-minibuffer-map (kbd "<down>") 'command-t-next-match)

    (define-key command-t-minibuffer-map (kbd "M-j") 'command-t-next-match)
    (define-key command-t-minibuffer-map (kbd "M-k") 'command-t-previous-match)

    (define-key command-t-minibuffer-map (kbd "C-n") 'command-t-next-match)
    (define-key command-t-minibuffer-map (kbd "C-p") 'command-t-previous-match)

    (set-keymap-parent command-t-minibuffer-map minibuffer-local-map))

  (when t ;;(null command-t-minibuffer-map)
    (setq command-t-matches-buffer-map (make-sparse-keymap))
    (define-key command-t-matches-buffer-map (kbd "q") 'command-t-halt))

  (save-window-excursion
    (setq command-t-matches-window (popwin:create-popup-window command-t-matches-window-height))
    (set-window-buffer (cadr command-t-matches-window) command-t-matches-buffer)
    (command-t-redraw-matches-buffer)

    (minibuffer-with-setup-hook 'command-t-minibuffer-setup-handler
      (read-from-minibuffer "Pattern: " nil command-t-minibuffer-map)

      (when (and command-t-matches-buffer (buffer-live-p command-t-matches-buffer))
        (set-buffer command-t-matches-buffer)
        (find-file (car (nth command-t-selected-match-index command-t-matches))))

      (command-t-cleanup))
    ))


(global-set-key (kbd "C-x p") 'command-t-find-file)
