(global-set-key (kbd "C-f") 'swiper) ;;search using C-F
(define-key isearch-mode-map "\C-f" 'isearch-repeat-forward)

(global-set-key (kbd "C-#") 'comment-line)
(global-set-key (kbd "C-O") 'counsel-find-file)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") 'split-window-right)
(global-set-key (kbd "M-3") 'split-window-below)
(global-set-key (kbd "C-S") 'save-buffer)
(global-set-key (kbd "C-S-d") 'crux-duplicate-current-line-or-region)
(global-set-key (kbd "C-P") 'projectile-find-file)
;; (global-set-key (kbd "C-Z") 'undo)

; multiple cursors
(global-set-key (kbd "C-<") 'mc/edit-lines)
(global-set-key (kbd "C-d") 'mc/mark-next-like-this)

(global-set-key [C-left] 'left-word)
(global-set-key [C-right]  'right-word)

(global-set-key (kbd "C-S-SPC") 'er/expand-region)

(global-set-key [f8] 'neotree-toggle)
(global-set-key [C-tab] 'company-complete)
(global-set-key [C-next] 'centaur-tabs-forward)
(global-set-key [C-prior] 'centaur-tabs-backward)

;(eval-after-load 'tide '(define-key 'tide-mode-map (kbd "M-RET") 'tide-fix))

(define-key dired-mode-map [tab] 'dired-subtree-toggle)
(define-key dired-mode-map "/" 'dired-narrow)

(define-key smartparens-mode-map (kbd "C-<left>") nil)
(define-key smartparens-mode-map (kbd "C-<right>") nil)

(define-key lsp-mode-map (kbd "M-RET") 'lsp-execute-code-action)

(if (string= system-type "darwin")
    (global-set-key (kbd "M-ß") (lambda () (interactive) (insert "\\"))))
