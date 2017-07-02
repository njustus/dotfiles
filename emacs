; global configs
(setq
 inhibit-startup-screen t
 create-lockfiles nil
 make-backup-files nil
 column-number-mode t
 global-linum-mode t ; line numbers
 show-paren-mode t ; highlight parens
 tab-width 2)

(require 'package)

(setq
 gruse-package-always-ensure t
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
		    ("melpa-stable" . "http://stable.melpa.org/packages/")))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(use-package ensime
  :pin melpa-stable)

(use-package rebecca-theme)

; window size
;; initial window
(setq initial-frame-alist
      '(
        (width . 120) ; character
        (height . 45) ; lines
        ))

(set-default-font "Source Code Pro-11")

; font size
(if (string= system-type "darwin")
    (set-face-attribute 'default nil :height 120)
    (set-face-attribute 'default nil :height 100))
; theme
(load-theme 'rebecca)
; automatically indent lines
(define-key global-map (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "<C-return>") (lambda ()
                   (interactive)
                   (end-of-line)
                   (newline-and-indent)))
