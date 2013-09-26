(defun build-tags ()
  (interactive)
  (message "building project tags")
  (let ((root (ffip-project-root)))
    (shell-command (format "cd %s && ripper-tags --format=emacs --exclude=spec --exclude=test -R -f TAGS --force"
                           root)))
  (visit-project-tags)
  (message "tags built successfully"))

(defun visit-project-tags ()
  (interactive)
  (let ((tags-file (concat (ffip-project-root) "TAGS")))
    (visit-tags-table tags-file)
    (message (concat "Loaded " tags-file))))

(global-set-key (kbd "M-.") 'etags-select-find-tag-at-point)

(eval-after-load 'etags-select
  '(progn
     (define-key etags-select-mode-map (kbd "RET") 'etags-select-goto-tag)
     (define-key etags-select-mode-map (kbd "M-RET") 'etags-select-goto-tag-other-window)
     (define-key etags-select-mode-map (kbd "M-j") 'etags-select-next-tag)
     (define-key etags-select-mode-map (kbd "M-k") 'etags-select-previous-tag)))
