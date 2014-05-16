(prelude-require-package 'ac-nrepl)
(require 'ac-nrepl)

(setq clojure-defun-style-default-indent t)

(defun cider-repl-reset ()
  (interactive)
  (cider-ensure-connected)
  (save-some-buffers)
  (set-buffer (cider-find-or-create-repl-buffer))
  (goto-char (point-max))
  (insert "(user/reset)")
  (cider-repl-return))

(defun cider-repl-reset ()
  (interactive)
  (cider-ensure-connected)
  (save-some-buffers)
  (set-buffer (cider-find-or-create-repl-buffer))
  (goto-char (point-max))
  (insert "(user/reset)")
  (cider-repl-return))

(add-to-list 'ac-modes 'cider-mode)
(add-to-list 'ac-modes 'cider-repl-mode)

(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)
