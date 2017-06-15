9;; ref: http://blog.csdn.net/nieyibin/article/details/7607546

(setq gdb-many-windows t)

(defun gud-kill ()
  "Kill gdb process."
  (interactive)
  (with-current-buffer gud-comint-buffer (comint-skip-input))
  (kill-process (get-buffer-process gud-comint-buffer)))

(add-hook 'gdb-mode-hook '(lambda ()
                            (define-key c-mode-base-map (kbd "<f5>") 'gdb)                ;; lauch gdb
                            (define-key c-mode-base-map (kbd "<C-f5>") 'gud-run)          ;; run
                            (define-key c-mode-base-map (kbd "<S-f5>") 'gud-kill)         ;; stop debug
                            (define-key c-mode-base-map (kbd "<f7>") '(lambda () (interactive) (compile compile-command))) ;; compile
                            (define-key c-mode-base-map (kbd "<f8>") 'gud-print)          ;; print variable
                            (define-key c-mode-base-map (kbd "<C-f8>") 'gud-pstar)        ;; print point
                            (define-key c-mode-base-map (kbd "<f9>") 'gud-break)          ;; C-x C-a C-b breakpoint add
                            (define-key c-mode-base-map (kbd "<C-f9>") 'gud-remove)       ;; C-x C-a C-d breakpoint remove
                            (define-key c-mode-base-map (kbd "<f10>") 'gud-next)          ;; C-x C-a C-n step over
                            (define-key c-mode-base-map (kbd "<C-f10>") 'gud-until)       ;; run to the cursor position
                            (define-key c-mode-base-map (kbd "<S-f10>") 'gud-jump)        ;; run from the cursor position
                            (define-key c-mode-base-map (kbd "<f11>") 'gud-step)          ;; C-x C-a C-s step into
                            (define-key c-mode-base-map (kbd "<C-f11>") 'gud-finish)      ;; C-x C-a C-f finish current function
                            ))

(provide 'init-gud)
