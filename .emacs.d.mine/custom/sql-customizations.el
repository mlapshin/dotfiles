(eval-after-load 'sql
  '(progn
     (define-key sql-mode-map (kbd "C-c C-e") (lambda ()
                                                (interactive)
                                                (save-current-buffer
                                                  (set-buffer "*SQL*")
                                                  (erase-buffer))
                                                (sql-send-buffer)))

     (define-key sql-mode-map (kbd "C-c C-r") (lambda ()
                                                (interactive)
                                                (save-current-buffer
                                                  (set-buffer "*SQL*")
                                                  (erase-buffer))
                                                (sql-send-region (region-beginning) (region-end))))
     ))
