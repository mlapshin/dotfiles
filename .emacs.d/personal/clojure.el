(prelude-require-packages '(ac-nrepl align-cljlet))
(require 'ac-nrepl)
(require 'align-cljlet)

(setq clojure-defun-style-default-indent nil
      lisp-indent-offset nil)

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
