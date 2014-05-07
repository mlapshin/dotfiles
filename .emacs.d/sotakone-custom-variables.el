(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu nil)
 '(ac-auto-start nil)
 '(ac-delay 0.3)
 '(ac-disable-faces (quote (font-lock-comment-face font-lock-doc-face)))
 '(ac-disable-inline t)
 '(ac-expand-on-auto-complete nil)
 '(ac-ignore-case nil)
 '(ac-menu-height 30)
 '(ac-modes
   (quote
    (lua-mode haml-mode emacs-lisp-mode lisp-interaction-mode c-mode cc-mode c++-mode clojure-mode java-mode perl-mode cperl-mode python-mode ruby-mode ecmascript-mode espresso-mode php-mode css-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode sql-mode sqli-mode clojure-mode cider-repl-mode)))
 '(ac-quick-help-delay 0.5)
 '(ac-show-menu-immediately-on-auto-complete t)
 '(ac-stop-words (quote ("begin" "if" "else" "end" "do")))
 '(ac-trigger-key "TAB")
 '(ac-use-fuzzy nil)
 '(ac-use-menu-map t)
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#ffffff" "#ff9da4" "#d1f1a9" "#ffeead" "#bbdaff" "#ebbbff" "#99ffff" "#002451"))
 '(auto-indent-next-pair-timer-geo-mean (quote ((default 0.0005 0))))
 '(auto-save-default nil)
 '(blink-cursor-mode nil)
 '(browse-url-browser-function (quote browse-url-generic))
 '(browse-url-firefox-program "firefox")
 '(browse-url-generic-program "conkeror")
 '(c-basic-offset 2)
 '(c-cleanup-list
   (quote
    (brace-else-brace brace-elseif-brace brace-catch-brace empty-defun-braces one-liner-defun defun-close-semi list-close-comma scope-operator compact-empty-funcall comment-close-slash)))
 '(c-strict-syntax-p t)
 '(calendar-week-start-day 1)
 '(clojure-defun-style-default-indent t)
 '(coffee-tab-width 2)
 '(color-theme-is-cumulative nil)
 '(command-t-ctmatch-path "~/bin/ctmatch")
 '(compilation-message-face (quote default))
 '(compilation-window-height 15)
 '(css-electric-keys (quote (125 59 41)))
 '(css-indent-offset 2)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (sanityinc-tomorrow-day)))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(delete-selection-mode t)
 '(dired-single-magic-buffer-name "*dired-single*")
 '(ecb-options-version "2.32")
 '(enable-local-variables :all)
 '(espresso-indent-level 2)
 '(etags-select-use-short-name-completion t)
 '(etags-table-alist (quote (("/home/w/medapp/" . "/home/w/medapp/TAGS"))))
 '(fci-rule-color "#00346e")
 '(global-auto-complete-mode t)
 '(global-font-lock-mode t)
 '(global-linum-mode nil)
 '(global-rainbow-delimiters-mode t)
 '(global-whitespace-mode nil)
 '(global-whitespace-newline-mode nil)
 '(haml-backspace-backdents-nesting nil)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-on-navigation-p t)
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(icomplete-mode nil)
 '(icomplete-prospects-height 5)
 '(ido-auto-merge-delay-time 9999999)
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-show-dot-for-dired t)
 '(ido-use-filename-at-point nil)
 '(iedit-toggle-key-default nil)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(jabber-account-list
   (quote
    (("mikhail.a.lapshin@gmail.com"
      (:network-server . "talk.google.com")
      (:port . 443)
      (:connection-type . ssl)))))
 '(kill-whole-line nil)
 '(line-number-display-limit nil)
 '(linum-delay t)
 '(list-directory-verbose-switches "-lh")
 '(magit-commit-all-when-nothing-staged (quote ask-stage))
 '(magit-diff-use-overlays nil)
 '(magit-use-overlays nil)
 '(majmodpri-mode-priorities
   (quote
    (cperl-mumamo-mode csound-sgml-mumamo-mode django-nxhtml-mumamo-mode django-html-mumamo-mode embperl-nxhtml-mumamo-mode embperl-html-mumamo-mode genshi-nxhtml-mumamo-mode genshi-html-mumamo-mode jsp-nxhtml-mumamo-mode jsp-html-mumamo-mode laszlo-nxml-mumamo-mode metapost-mumamo-mode mjt-nxhtml-mumamo-mode mjt-html-mumamo-mode noweb2-mumamo-mode perl-mumamo-mode smarty-nxhtml-mumamo-mode smarty-html-mumamo-mode nxhtml-mumamo-mode html-mumamo-mode nxml-mumamo-mode nxml-mode)))
 '(make-backup-files nil)
 '(max-lisp-eval-depth 50000)
 '(max-specpdl-size 100000)
 '(nxhtml-default-encoding (quote utf-8))
 '(nxhtml-skip-welcome t)
 '(org-agenda-files (quote ("/home/sotakone/default.org")))
 '(org-log-done "time")
 '(popwin-mode t)
 '(popwin:reuse-window nil)
 '(popwin:special-display-config
   (quote
    (("*cider-doc*" :regexp nil)
     ("*cider-macroexpansion*" :regexp nil)
     ("*cider-error*" :regexp nil)
     ("*rspec-compilation*" :regexp nil :noselect t :stick t :tail t)
     (help-mode)
     (completion-list-mode :noselect t)
     (compilation-mode :noselect t :tail t)
     (grep-mode :noselect t :stick t)
     (occur-mode :noselect t)
     ("*Pp Macroexpand Output*" :noselect t)
     ("*Shell Command Output*" :tail t)
     ("*vc-diff*")
     ("*vc-change-log*")
     (" *undo-tree*" :width 60 :position right)
     ("^\\*anything.*\\*$" :regexp t)
     ("*slime-apropos*")
     ("*slime-macroexpansion*")
     ("*slime-description*")
     ("*slime-compilation*" :noselect t)
     ("*slime-xref*")
     (sldb-mode :stick t)
     (slime-repl-mode)
     (slime-connection-list-mode))))
 '(projectile-completion-system (quote grizzl))
 '(projectile-global-mode t)
 '(recentf-max-saved-items 50)
 '(recentf-mode t)
 '(rspec-executables
   (quote
    ("rspec" "/opt/local/bin/spec" "spec" "/usr/bin/spec" "/usr/local/bin/spec")))
 '(rspec-spec-command "rspec --drb")
 '(rspec-use-opts-file-when-available nil)
 '(rspec-use-rake-flag nil)
 '(rspec-use-rake-when-possible nil)
 '(rspec-use-rvm t)
 '(ruby-electric-expand-delimiters-list (quote (91 40)))
 '(ruby-use-encoding-map nil)
 '(scroll-bar-mode nil)
 '(scroll-margin 2)
 '(show-paren-mode t)
 '(show-smartparens-global-mode t)
 '(show-trailing-whitespace t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(smooth-scroll-margin 3)
 '(smooth-scroll-mode t)
 '(solarized-italic t)
 '(speedbar-frame-parameters
   (quote
    ((minibuffer)
     (width . 20)
     (border-width . 0)
     (menu-bar-lines . 0)
     (tool-bar-lines . 0)
     (unsplittable . t)
     (set-background-color "black"))))
 '(sql-postgres-login-params
   (quote
    ((user :default "mlapshin")
     server
     (database :default "postgres")
     port)))
 '(sql-postgres-options (quote ("-P" "pager=off" "-w")))
 '(standard-indent 2)
 '(tab-stop-list (quote (2 4 6 8 10 12 14 16 18 20 22 24 26 28 30)))
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(tramp-default-method "ssh")
 '(truncate-lines t)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#ff9da4")
     (40 . "#ffc58f")
     (60 . "#ffeead")
     (80 . "#d1f1a9")
     (100 . "#99ffff")
     (120 . "#bbdaff")
     (140 . "#ebbbff")
     (160 . "#ff9da4")
     (180 . "#ffc58f")
     (200 . "#ffeead")
     (220 . "#d1f1a9")
     (240 . "#99ffff")
     (260 . "#bbdaff")
     (280 . "#ebbbff")
     (300 . "#ff9da4")
     (320 . "#ffc58f")
     (340 . "#ffeead")
     (360 . "#d1f1a9"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(whitespace-global-modes (quote (not comint-mode)))
 '(whitespace-style
   (quote
    (tabs trailing space-before-tab space-after-tab tab-mark)))
 '(window-numbering-mode t)
 '(x-select-enable-clipboard t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(window-numbering-face ((t (:foreground "red" :weight bold))) t))
