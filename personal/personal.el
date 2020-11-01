(prelude-require-packages '(rainbow-delimiters
                            yasnippet
                            yasnippet-snippets
                            multiple-cursors
                            neotree
                            all-the-icons
                            dired-narrow
                            dired-subtree
                            ))

;; initial window
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(add-to-list 'auto-mode-alist '("\\.tsx?\\'" . typescript-mode))

(set-frame-font "Hack-11")
                                       ; font size
(if (string= system-type "darwin")
    (set-face-attribute 'default nil :height 120)
  (set-face-attribute 'default nil :height 100))

(setq
 prelude-guru nil
 prelude-whitespace nil
 prelude-use-smooth-scrolling t
 prelude-format-on-save nil
 auto-save-default nil
 make-backup-files nil
 smartparens-global-strict-mode nil
 ispell-dictionary "deutsch8"
 neo-theme (if (display-graphic-p) 'icons 'arrow)
 initial-major-mode 'org-mode
 initial-scratch-message "# scratch buffer for notes")

(yas-global-mode 1)
(global-linum-mode 1)
(menu-bar-mode 1)

(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'scala-mode-hook 'rainbow-delimiters-mode)
(add-hook 'typescript-mode-hook 'rainbow-delimiters-mode)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
