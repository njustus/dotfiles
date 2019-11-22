(setq prelude-theme 'doom-moonlight)

(if (string= system-type "darwin")
    (progn
      (require 'gnutls)
      (add-to-list 'gnutls-trustfiles "/usr/local/etc/openssl/cert.pem")
     (setq mac-right-option-modifier nil)))
