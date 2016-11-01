;; -*- coding: utf-8 -*-

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;----------------------------------------------------------------------------
;; Which functionality to enable (use t or nil for true and false)
;;----------------------------------------------------------------------------
(setq *is-a-mac* (eq system-type 'darwin))
(setq *win64* (eq system-type 'windows-nt) )
(setq *cygwin* (eq system-type 'cygwin) )
(setq *linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux)) )
(setq *unix* (or *linux* (eq system-type 'usg-unix-v) (eq system-type 'berkeley-unix)) )
(setq *emacs24* (and (not (featurep 'xemacs)) (or (>= emacs-major-version 24))) )
(setq *no-memory* (cond
                   (*is-a-mac*
                    (< (string-to-number (nth 1 (split-string (shell-command-to-string "sysctl hw.physmem")))) 4000000000))
                   (*linux* nil)
                   (t nil)))

;;----------------------------------------------------------------------------
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!ATTENTTION!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;;----------------------------------------------------------------------------
;;set emacs startup path

;;M-x setenv RET HOME RET path
; (setenv "HOME" "D:/" t)

;; if windows then set work default-directory
(when *win64*
    (setq default-directory "C:/Download/") nil nil)


(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

;; @see https://www.reddit.com/r/emacs/comments/3kqt6e/2_easy_little_known_steps_to_speed_up_emacs_start/
;; Normally file-name-handler-alist is set to
;; (("\\`/[^/]*\\'" . tramp-completion-file-name-handler)
;; ("\\`/[^/|:][^/|]*:" . tramp-file-name-handler)
;; ("\\`/:" . file-name-non-special))
;; Which means on every .el and .elc file loaded during start up, it has to runs those regexps against the filename.
(let ((file-name-handler-alist nil))
  (require 'cl-lib)
  (require 'init-utils)
  (require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el

  ;;init elpa package manager
  (require 'init-elpa)

  ;;init path
  (require 'init-exec-path)
  (require 'init-gui-frames)
  (require 'init-global-key-map)

  ;;init plugins is in package manager
  (require 'init-ido)
  (require 'init-ivy)
  (require 'init-theme)
  (require 'init-auto-complete)

  ;;init plugins is not in package manager
  (require 'init-window-numbering)
  (require 'init-font-set)

;;custom conf
  (setq custom (concat user-emacs-directory ".custom.el"))
  (if (file-exists-p custom) (load-file custom)))

;;forbid emacs auto-generate conf in this file
;; @see https://www.reddit.com/r/emacs/comments/4q4ixw/how_to_forbid_emacs_to_touch_configuration_files/
(setq custom-file (concat user-emacs-directory "custom-set-variables.el"))
(load custom-file 'noerror)
