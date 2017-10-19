                                        ; window size
;; initial window
(setq initial-frame-alist
      '(
        (width . 170) ; character
        (height . 55) ; lines
        ))

(set-default-font "Source Code Pro-11")

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
 ensime-startup-notification nil)

(global-linum-mode 1)
(menu-bar-mode 1)

(if (string= system-type "darwin")
    (setq mac-right-option-modifier nil))

(prelude-require-package 'ensime)
