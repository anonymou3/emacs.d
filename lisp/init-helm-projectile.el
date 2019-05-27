(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-switch-project-action 'helm-projectile-find-file)
;; (setq projectile-switch-project-action 'helm-projectile)

(provide 'init-helm-projectile)
