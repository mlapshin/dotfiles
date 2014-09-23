(eval-after-load 'sql
                 '(progn
                    (define-key sql-mode-map (kbd "C-x C-e") 'sql-send-region)))
