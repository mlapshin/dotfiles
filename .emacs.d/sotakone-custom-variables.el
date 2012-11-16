(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu nil)
 '(ac-auto-start 2)
 '(ac-delay 0.3)
 '(ac-disable-faces (quote (font-lock-comment-face font-lock-doc-face)))
 '(ac-expand-on-auto-complete nil)
 '(ac-ignore-case nil)
 '(ac-menu-height 30)
 '(ac-modes (quote (lua-mode haml-mode emacs-lisp-mode lisp-interaction-mode c-mode cc-mode c++-mode clojure-mode java-mode perl-mode cperl-mode python-mode ruby-mode ecmascript-mode espresso-mode php-mode css-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode)))
 '(ac-show-menu-immediately-on-auto-complete t)
 '(ac-stop-words (quote ("begin" "if" "else" "end" "do")))
 '(ac-trigger-key "<tab>")
 '(ac-use-menu-map t)
 '(auto-save-default nil)
 '(blink-cursor-mode nil)
 '(browse-url-browser-function (quote browse-url-generic))
 '(browse-url-firefox-program "firefox")
 '(browse-url-generic-program "conkeror")
 '(c-basic-offset 2)
 '(c-cleanup-list (quote (brace-else-brace brace-elseif-brace brace-catch-brace empty-defun-braces one-liner-defun defun-close-semi list-close-comma scope-operator compact-empty-funcall comment-close-slash)))
 '(c-strict-syntax-p t)
 '(calendar-week-start-day 1)
 '(color-theme-is-cumulative nil)
 '(compilation-window-height 15)
 '(css-electric-keys (quote (125 59 41)))
 '(css-indent-offset 2)
 '(delete-selection-mode t)
 '(dired-single-magic-buffer-name "*dired-single*")
 '(ecb-options-version "2.32")
 '(enable-local-variables nil)
 '(espresso-indent-level 2)
 '(etags-table-alist (quote (("/home/w/medapp/" . "/home/w/medapp/TAGS"))))
 '(global-auto-complete-mode t)
 '(global-font-lock-mode t)
 '(global-hl-line-mode t)
 '(global-linum-mode nil)
 '(global-whitespace-mode t)
 '(global-whitespace-newline-mode t)
 '(haml-backspace-backdents-nesting nil)
 '(highlight-symbol-on-navigation-p t)
 '(hl-line-sticky-flag nil)
 '(icomplete-mode nil)
 '(icomplete-prospects-height 5)
 '(ido-auto-merge-delay-time 9999999)
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-show-dot-for-dired t)
 '(ido-use-filename-at-point nil)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(kill-whole-line nil)
 '(line-number-display-limit nil)
 '(linum-delay t)
 '(list-directory-verbose-switches "-lh")
 '(magit-commit-all-when-nothing-staged t)
 '(majmodpri-mode-priorities (quote (cperl-mumamo-mode csound-sgml-mumamo-mode django-nxhtml-mumamo-mode django-html-mumamo-mode embperl-nxhtml-mumamo-mode embperl-html-mumamo-mode genshi-nxhtml-mumamo-mode genshi-html-mumamo-mode jsp-nxhtml-mumamo-mode jsp-html-mumamo-mode laszlo-nxml-mumamo-mode metapost-mumamo-mode mjt-nxhtml-mumamo-mode mjt-html-mumamo-mode noweb2-mumamo-mode perl-mumamo-mode smarty-nxhtml-mumamo-mode smarty-html-mumamo-mode nxhtml-mumamo-mode html-mumamo-mode nxml-mumamo-mode nxml-mode)))
 '(make-backup-files nil)
 '(max-lisp-eval-depth 50000)
 '(max-specpdl-size 100000)
 '(nxhtml-default-encoding (quote utf-8))
 '(nxhtml-skip-welcome t)
 '(org-agenda-files (quote ("/home/sotakone/default.org")))
 '(org-log-done "time")
 '(recentf-max-saved-items 50)
 '(recentf-mode t)
 '(rspec-executables (quote ("rspec" "/opt/local/bin/spec" "spec" "/usr/bin/spec" "/usr/local/bin/spec")))
 '(rspec-spec-command "rspec --drb")
 '(rspec-use-opts-file-when-available nil)
 '(rspec-use-rake-flag nil)
 '(rspec-use-rvm t)
 '(ruby-electric-expand-delimiters-list (quote (91 40)))
 '(ruby-use-encoding-map nil)
 '(scroll-bar-mode nil)
 '(scroll-margin 2)
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(speedbar-frame-parameters (quote ((minibuffer) (width . 20) (border-width . 0) (menu-bar-lines . 0) (tool-bar-lines . 0) (unsplittable . t) (set-background-color "black"))))
 '(standard-indent 2)
 '(tab-stop-list (quote (2 4 6 8 10 12 14 16 18 20 22 24 26 28 30)))
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(tramp-default-method "ssh")
 '(truncate-lines t)
 '(whitespace-style (quote (tabs trailing space-before-tab space-after-tab tab-mark)))
 '(x-select-enable-clipboard t)
 '(yas-fallback-behavior (quote return-nil))
 '(yas-global-mode t nil (yasnippet))
 '(yas-prompt-functions (quote (yas/dropdown-prompt yas/completing-prompt yas/ido-prompt yas/no-prompt)))
 '(yas-snippet-dirs "/home/sotakone/.emacs.d/snippets/text-mode/" nil (yasnippet))
 '(yas-trigger-key "")
 '(yas-use-menu (quote full)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-etags-candidate-face ((t (:background "light gray" :foreground "black" :weight bold))))
 '(ac-etags-selection-face ((t (:background "dark magenta" :foreground "white" :weight bold))))
 '(hl-line ((t (:background "#262626")))))
