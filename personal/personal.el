(prelude-require-packages '(neotree
                            rainbow-delimiters
                            yasnippet
                            yasnippet-snippets
                            multiple-cursors
                            company
                            lsp-java
                            rbenv
                            neotree
                            all-the-icons))

(prelude-require-packages '(doom-themes))

;; initial window
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(add-to-list 'auto-mode-alist '("\\.tsx?\\'" . typescript-mode))

(set-default-font "Hack-10")
                                       ; font size
(if (string= system-type "darwin")
    (set-face-attribute 'default nil :height 120)
  (set-face-attribute 'default nil :height 100))

(setq
 prelude-guru nil
 prelude-whitespace nil
 prelude-use-smooth-scrolling t
 auto-save-default nil
 make-backup-files nil
 smartparens-global-strict-mode nil
 ispell-dictionary "deutsch8"
 neo-theme (if (display-graphic-p) 'icons 'arrow))

(yas-global-mode 1)
(global-rbenv-mode 1)
(global-company-mode 1)
(global-linum-mode 1)
(menu-bar-mode 1)

(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'scala-mode-hook 'rainbow-delimiters-mode)
(add-hook 'typescript-mode-hook 'rainbow-delimiters-mode)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
