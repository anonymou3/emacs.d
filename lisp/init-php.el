;; https://www.emacswiki.org/emacs/PhpMode

(require 'php-mode)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

(provide 'init-php)
