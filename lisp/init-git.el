;; tips:
;; set git.exe path to %PATH% in windows and git config basic info

;; https://magit.vc/manual/magit/Getting-Started.html#Getting-Started
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;; https://github.com/magit/magit/wiki/Pushing-with-Magit-from-Windows#openssh-passphrase-caching-via-ssh-agent
;; Here my openssh have a password
(setenv "SSH_ASKPASS" "git-gui--askpass")

(provide 'init-git)
