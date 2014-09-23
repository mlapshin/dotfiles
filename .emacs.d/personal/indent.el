(setq standard-indent 2
      tab-width 2
      web-mode-code-indent-offset 2
      web-mode-markup-indent-offset 2)

(eval-after-load 'web-mode
  '(progn
     (setq prelude-web-mode-hook (lambda ()))))
