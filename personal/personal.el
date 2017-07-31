                                        ; window size
;; initial window
(setq initial-frame-alist
      '(
        (width . 140) ; character
        (height . 60) ; lines
        ))


(set-default-font "Source Code Pro-11")

                                       ; font size
(if (string= system-type "darwin")
    (set-face-attribute 'default nil :height 120)
  (set-face-attribute 'default nil :height 100))

(setq
  line-number-mode t
  global-linum-mode t
  prelude-guru nil
  prelude-whitespace nil
  auto-save-default nil
  make-backup-files nil)

(prelude-require-package 'ensime)
