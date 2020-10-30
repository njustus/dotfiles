(require 'ibuffer)
(setq ibuffer-saved-filter-groups
      '(("default"
         ("controllers" (filename . "controllers"))
         ("models" (filename . "models"))
         ("views" (filename . "views"))
         ("emacs" (mode . emacs-lisp-mode))
         ("dired" (mode . dired-mode))
         )))

(add-hook 'ibuffer-mode-hook
	  '(lambda ()
             (ibuffer-auto-mode 1)
             (ibuffer-switch-to-saved-filter-groups "default")
             ))
