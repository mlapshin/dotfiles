(defun ml-smart-beginning-of-line ()
  (interactive)

  (let ((saved-point (point)))
    (beginning-of-line-text)
    (if (= saved-point (point)) (beginning-of-line))))

(global-set-key (kbd "C-a") 'ml-smart-beginning-of-line)
