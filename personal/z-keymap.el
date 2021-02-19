(global-set-key (kbd "C-f") 'isearch-forward) ;;search using C-F
(define-key isearch-mode-map "\C-f" 'isearch-repeat-forward)

(global-set-key (kbd "C-#") 'comment-line)
(global-set-key (kbd "C-O") 'find-file)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") 'split-window-right)
(global-set-key (kbd "M-3") 'split-window-below)
(global-set-key (kbd "C-S") 'save-buffer)
(global-set-key (kbd "C-S-d") 'crux-duplicate-current-line-or-region)
(global-set-key (kbd "C-P") 'projectile-find-file)
(global-set-key (kbd "C-Z") 'undo)

; multiple cursors
(global-set-key (kbd "C-d") 'mc/mark-next-like-this)

(global-set-key [C-left] 'left-word)
(global-set-key [C-right]  'right-word)

(global-set-key [f8] 'neotree-toggle)
(global-set-key [C-tab] 'company-complete)

(eval-after-load 'tide '(define-key 'tide-mode-map (kbd "M-RET") 'tide-fix))

(eval-after-load 'dired '(define-key dired-mode-map [tab] 'dired-subtree-toggle))
(eval-after-load 'dired '(define-key dired-mode-map "/" 'dired-narrow))

(if (string= system-type "darwin")
    (global-set-key (kbd "M-ß") (lambda () (interactive) (insert "\\"))))
