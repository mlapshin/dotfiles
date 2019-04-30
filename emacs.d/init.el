(let ((emacsd-dir (file-name-directory load-file-name)))
  (add-to-list 'load-path (concat emacsd-dir "/vendor/use-package"))
  (require 'use-package)

  (require 'package)

  (package-initialize)

  (require 'use-package-ensure)
  (setq use-package-always-ensure t)

  (let* ((stuff-dir (concat emacsd-dir "/stuff"))
         (load-it (lambda (f) (load-file (concat (file-name-as-directory stuff-dir) f)))))
    (mapc load-it (directory-files stuff-dir nil "\\.el$")))

  (message "Hello Master!"))
