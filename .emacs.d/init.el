(let ((emacsd-dir (file-name-directory load-file-name)))
  (add-to-list 'load-path (concat emacsd-dir "/vendor/use-package"))
  (require 'use-package)

  (require 'package)

  ;; add melpa
  (add-to-list 'package-archives
	       '("melpa" . "http://melpa.milkbox.net/packages/"))
  
  (package-initialize)

  (require 'use-package-ensure)
  (setq use-package-always-ensure t)

  (setq make-backup-files nil)
  (setq auto-save-default nil)
  (setq create-lockfiles nil)

  (let* ((stuff-dir (concat emacsd-dir "/stuff"))
         (load-it (lambda (f) (load-file (concat (file-name-as-directory stuff-dir) f)))))
    (mapc load-it (directory-files stuff-dir nil "\\.el$")))

  (message "Hello Master!"))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (counsel ivy magit popwin ibuffer-vc company cider smartparens window-numbering moe-theme powerline))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
