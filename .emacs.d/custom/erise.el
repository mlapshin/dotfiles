(defvar erise-keyname-length-limit 30)
(defvar erise-shell-command "erise")

;;;###autoload
(defun erise (start end)
  (interactive "r")

  (if (region-active-p)
      (let* ((text (erise-sanitize-text(buffer-substring start end)))
             (keyname (read-string "Key name: "
                                   (erise-default-key-name text)))
             (short-keyname (car (last (split-string keyname "\\.") 1)))
             (rails-root (if (fboundp 'ffip-project-root)
                             (ffip-project-root)
                           (projectile-project-root)))
             (locale-file (expand-file-name
                           (format "%sconfig/locales/en.yml" rails-root)))
             (command (format "%s %s %s %s"
                              erise-shell-command
                              (shell-quote-argument locale-file)
                              (shell-quote-argument keyname)
                              (shell-quote-argument text))))

        (message (shell-command-to-string command))

        (save-excursion
          (delete-region start end)
          (goto-char start)
          (insert (format "t('.%s')" short-keyname))))

    (message "erise: region is not active")))

(defun erise-default-key-name (text)
  (let* ((filename-component
          (split-string
           (replace-regexp-in-string
            "\\`.*?app/document_archive/templates/\\(.*\\).haml\\'"
            "\\1"
            (replace-regexp-in-string
             "\\`.*?app/\\(controllers/.*\\)_controller\\.rb\\'"
             "\\1"
             (replace-regexp-in-string
              "\\`.*?app/views/\\(.*\\)\\.html\\.haml\\'"
              "\\1"
              buffer-file-name)))
           "/"))
         (sanitized-text (erise-sanitize-keyname text))
         (text-component (substring sanitized-text
                                    0 (min (length sanitized-text)
                                           erise-keyname-length-limit))))
    (mapconcat 'identity
               (remove ""
                       (mapcar 'erise-sanitize-keyname
                               (append '("en")
                                       filename-component
                                       (list text-component))))
               ".")))

(defun erise-sanitize-keyname (str)
  (erise-strip-underscores
   (replace-regexp-in-string
    "_+"
    "_"
    (replace-regexp-in-string
     "[^[:alnum:]]"
     "_"
     (downcase str)))))

(defun erise-sanitize-text(text)
  (erise-chomp
   (replace-regexp-in-string
    "\\`\\(['\"]\\)\\(.+\\)\\1\\'"
    "\\2"
    text)))

;; <http://www.emacswiki.org/emacs/ElispCookbook#toc6>.
(defun erise-chomp (str)
  "Chomp leading and tailing whitespace from STR."
  (while (string-match "\\`\n+\\|^\\s-+\\|\\s-+$\\|\n+\\'"
                       str)
    (setq str (replace-match "" t t str)))
  str)

(defun erise-strip-underscores (str)
  "Strip leading and tailing underscores from STR."
  (replace-regexp-in-string
   "\\(\\`_+\\|_+\\'\\)"
   ""
   str))

;; (global-set-key (kbd "C-c C-e") 'erise)
(global-unset-key (kbd "C-c C-e"))
