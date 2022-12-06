(use-package popwin
  :init
  (setq popwin:reuse-window t)

  (setq popwin:special-display-config
        (quote
         (("*cider-doc*" :regexp nil)
          ("*cider-macroexpansion*" :regexp nil)
          ("*cider-error*" :regexp nil :position bottom :stick t :tail t)
          ("*cider-test-report*" :regexp nil :position bottom :stick t :tail t)
          (help-mode)
          (completion-list-mode :noselect t)
          (compilation-mode :noselect t :tail t)
          (grep-mode :noselect t :stick t)
          ("*HTTP Response*" :noselect t :stick t :position bottom)
          (occur-mode :noselect t)
          ("*Pp Macroexpand Output*" :noselect t)
          ("*Shell Command Output*" :tail t)
          ("*vc-diff*")
          ("*vc-change-log*")
          ("*undo-tree*" :width 60 :position right)
          ("^\\*anything.*\\*$" :regexp t :stick t :position bottom)
          ("*slime-apropos*")
          ("*slime-macroexpansion*")
          ("*slime-description*")
          ("*slime-compilation*" :noselect t)
          ("*Gofmt Errors*" :noselect t)
          ("*slime-xref*")
          (sldb-mode :stick t)
          (slime-repl-mode)
          (slime-connection-list-mode))))

  :config
  (popwin-mode +1))
