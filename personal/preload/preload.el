(if (eq system-type 'gnu/linux)
   (setq prelude-theme 'doom-city-lights)
  ;(setq prelude-theme 'base16-atelier-forest-light))
  (setq prelude-theme 'doom-nord-light))

(if (string= system-type "darwin")
    (progn
      (require 'gnutls)
      (add-to-list 'gnutls-trustfiles "/usr/local/etc/openssl/cert.pem")
     (setq mac-right-option-modifier nil)))
