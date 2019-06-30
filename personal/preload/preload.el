(if (eq system-type 'gnu/linux)
   (setq prelude-theme 'forest-blue)
  (setq prelude-theme 'doom-nord-light))

(if (string= system-type "darwin")
    (progn
      (require 'gnutls)
      (add-to-list 'gnutls-trustfiles "/usr/local/etc/openssl/cert.pem")
     (setq mac-right-option-modifier nil)))
