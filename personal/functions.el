
(defun personal-translucent-window ()
  (interactive)
  (set-frame-parameter (selected-frame) 'alpha '(70 50)))

(defun personal-opaque-window ()
  (interactive)
  (set-frame-parameter (selected-frame) 'alpha '(100 100)))
