(when (eq system-type 'darwin)
  (defun ml-mac-copy ()
    (shell-command-to-string "pbpaste"))

  (defun ml-mac-paste (text &optional push)
    (let ((process-connection-type nil))
      (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
        (process-send-string proc text)
        (process-send-eof proc))))

  (setq interprogram-cut-function 'ml-mac-paste)
  (setq interprogram-paste-function 'ml-mac-copy))
