;; https://github.com/deb0ch/emacs-winum

(custom-set-faces '(winum-face ((t (:foreground "DeepPink" :underline "DeepPink" :weight bold)))))

(setq winum-keymap
    (let ((map (make-sparse-keymap)))
      (define-key map (kbd "C-`") 'winum-select-window-by-number)
      (define-key map (kbd "C-²") 'winum-select-window-by-number)
      (define-key map (kbd "M-0") 'winum-select-window-0-or-10)
      (define-key map (kbd "M-1") 'winum-select-window-1)
      (define-key map (kbd "M-2") 'winum-select-window-2)
      (define-key map (kbd "M-3") 'winum-select-window-3)
      (define-key map (kbd "M-4") 'winum-select-window-4)
      (define-key map (kbd "M-5") 'winum-select-window-5)
      (define-key map (kbd "M-6") 'winum-select-window-6)
      (define-key map (kbd "M-7") 'winum-select-window-7)
      (define-key map (kbd "M-8") 'winum-select-window-8)
      map))

(require 'winum)

(defun my-winum-assign-func ()
  (cond
   ((equal (buffer-name) "*Calculator*")
    9)
   ((string-match-p (buffer-name) ".*\\*NeoTree\\*.*")
    0)
   (t
    nil)))

(setq window-numbering-scope            'global
      winum-reverse-frame-list          nil
      winum-auto-assign-0-to-minibuffer t
      winum-assign-func                 'my-winum-assign-func
      winum-auto-setup-mode-line        t
      winum-mode-line-position          1
      winum-ignored-buffers             '(" *which-key*"))

(winum-mode)

(provide 'init-winum)
