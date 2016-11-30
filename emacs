; global configs
(setq
 inhibit-startup-screen t
 create-lockfiles nil
 make-backup-files nil
 column-number-mode t)

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

; window size
;; initial window
(setq initial-frame-alist
      '(
        (width . 120) ; character
        (height . 45) ; lines
        ))

; font size
(if (string= system-type "darwin")
    (set-face-attribute 'default nil :height 120)
    (set-face-attribute 'default nil :height 100))
; theme
(load-theme 'tango)
; highlight matching parentheses
(show-paren-mode 1)
(setq tab-width 2)
; automatically indent lines
(define-key global-map (kbd "RET") 'newline-and-indent)