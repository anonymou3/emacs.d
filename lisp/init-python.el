;; https://realpython.com/blog/python/emacs-the-best-python-editor/

;; At first install pip tools then
;; pip install flake8 && pip install jedi

(elpy-enable)
;;(elpy-use-ipython)


;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(provide 'init-python)
