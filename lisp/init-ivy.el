;; {{ recentf-mode
(recentf-mode 1)
(setq recentf-keep '(file-remote-p file-readable-p))
(setq recentf-max-saved-items 2048
      recentf-exclude '("/tmp/"
                        "/ssh:"
                        "/sudo:"
                        ;; ctags
                        "/TAGS$"
                        ;; global
                        "/GTAGS$"
                        "/GRAGS$"
                        "/GPATH$"
                        ;; binary
                        "\\.mkv$"
                        "\\.mp[34]$"
                        "\\.avi$"
                        "\\.pdf$"
                        ;; sub-titles
                        "\\.sub$"
                        "\\.srt$"
                        "\\.ass$"
                        ;; ~/.emacs.d/**/*.el included
                        ;; "/home/[a-z]\+/\\.[a-df-z]" ; configuration file should not be excluded
                        ))
;; }}

(defun counsel-recentf-goto ()
  "Recent files."
  (interactive)
  (unless recentf-mode (recentf-mode 1))
  (if (fboundp 'counsel-recentf)
      (counsel-recentf)
    (ivy-recentf)))

(defun counsel-goto-recent-directory ()
  "Goto recent directories."
  (interactive)
  (unless recentf-mode (recentf-mode 1))
  (let* ((collection (delete-dups
                      (append (mapcar 'file-name-directory recentf-list)
                              ;; fasd history
                              (if (executable-find "fasd")
                                  (split-string (shell-command-to-string "fasd -ld") "\n" t))))))
    (ivy-read "directories:" collection :action 'dired)))

(global-set-key [(control x)(control r)] 'counsel-recentf-goto)
(global-set-key [(control x)(control d)] 'counsel-goto-recent-directory)

(provide 'init-ivy)