(require 'package)

;; Set it to `t' to use safer HTTPS to download packages
(defvar melpa-use-https-repo nil
  "By default, HTTP is used to download packages.
But you may use safer HTTPS instead.")

;; List of VISIBLE packages from melpa-unstable (http://melpa.org)
;; Feel free to add more packages!
(defvar melpa-include-packages
  '(
    flymake-lua
    lua-mode
    )
  "Don't install any Melpa packages except these packages")

;; We include the org repository for completeness, but don't use it.
;; Lock org-mode temporarily:
;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(setq package-archives
      '(;; uncomment below line if you need use GNU ELPA
        ;; ("gnu" . "https://elpa.gnu.org/packages/")
        ;; ("melpa-cn" . "https://elpa.emacs-china.org/melpa/")
        ;; ("melpa-stable-cn" . "http://elpa.emacs-china.org/melpa-stable/")
        ;; ("marmalade" . "https://marmalade-repo.org/packages/")
        ("elpy" . "https://jorgenschaefer.github.io/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("melpa-stable" . "http://stable.melpa.org/packages/")))

;;------------------------------------------------------------------------------
;; Internal implementation, newbies should NOT touch code below this line!
;;------------------------------------------------------------------------------

;; Patch up annoying package.el quirks
(defadvice package-generate-autoloads (after close-autoloads (name pkg-dir) activate)
  "Stop package.el from leaving open autoload files lying around."
  (let* ((path (expand-file-name (concat
                                  ;; name is string when emacs <= 24.3.1,
                                  (if (symbolp name) (symbol-name name) name)
                                  "-autoloads.el") pkg-dir)))
    (with-current-buffer (find-file-existing path)
      (kill-buffer nil))))

(defun package-filter-function (package version archive)
  "Optional predicate function used to internally filter packages used by package.el.

  The function is called with the arguments PACKAGE VERSION ARCHIVE, where
  PACKAGE is a symbol, VERSION is a vector as produced by `version-to-list', and
  ARCHIVE is the string name of the package archive."
  (let* (rlt)
    (cond
      ((string= archive "melpa-stable")
       (setq rlt t)
       ;; don's install `request v0.0.3' which drop suppport of Emacs 24.3
       (if (string= package "request") (setq rlt nil)))
      ((string= archive "melpa")
       (cond
         ;; a few exceptions from unstable melpa
         ((or (memq package melpa-include-packages)
              ;; install all color themes
              (string-match (format "%s" package) "-theme"))
          (setq rlt t))
         (t
           ;; I don't trust melpa which is too unstable
           (setq rlt nil))))
      (t
        ;; other third party repositories I trust
        (setq rlt t)))
    rlt))

(defadvice package--add-to-archive-contents
  (around filter-packages (package archive) activate)
  "Add filtering of available packages using `package-filter-function'."
  (if (package-filter-function (car package)
                               (funcall (if (fboundp 'package-desc-version)
                                            'package--ac-desc-version
                                          'package-desc-vers)
                                        (cdr package))
                               archive)
      ad-do-it))

;; On-demand installation of packages
(defun require-package (package &optional min-version no-refresh)
  "Ask elpa to install given PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

;;------------------------------------------------------------------------------
;; Fire up package.el and ensure the following packages are installed.
;;------------------------------------------------------------------------------

(package-initialize)

(require-package 'async)
(require-package 'php-mode)

;; for python
;; (require-package 'ein)
(require-package 'pyvenv)
(require-package 'elpy)          ;; pip install flake8 && pip install jedi
(require-package 'flycheck)
(require-package 'py-autopep8)

;; for lua
(require-package 'lua-mode)
(require-package 'flymake-lua)

;; for golang
(require-package 'company-go)

(require-package 'better-defaults)
(require-package 'material-theme)
(require-package 'flx-ido)
(require-package 'ivy)
(require-package 'auto-complete)
(require-package 'yasnippet)
(require-package 'magit)
(require-package 'winum)

(provide 'init-elpa)
