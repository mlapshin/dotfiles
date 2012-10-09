(require 'js)

(add-hook 'js-mode-hook
          (lambda ()
            (paredit-mode 0)
            (auto-complete-mode 1)))

(setq js-indent-level 2)

(define-key js-mode-map (kbd ",") 'self-insert-command)

(font-lock-add-keywords 'js-mode `(("\\(function *\\)("
                                    (0 (progn (compose-region (match-beginning 1)
                                                              (match-end 1) "\u0192")
                                              nil)))))

;; This is a hack to make haml-mode work without javascript-mode installed
(provide 'javascript-mode)
