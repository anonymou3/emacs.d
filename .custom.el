;; -*- coding: utf-8 -*-

;;font setting
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; move to site-lisp/font-set module
;; (set-face-attribute 'default nil :family "Consolas")
;; (set-face-attribute 'default nil :height 135)

;;default code utf-8
;;http://stackoverflow.com/questions/2901541/which-coding-system-should-i-use-in-emacs?noredirect=1&lq=1
;;(setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
;;(set-language-environment 'utf-8)
;;(set-keyboard-coding-system 'utf-8-mac) ; For old Carbon emacs on OS X only
;;(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
;;(set-terminal-coding-system 'utf-8)
;;(unless (eq system-type 'windows-nt)
;;    (set-selection-coding-system 'utf-8))
(prefer-coding-system 'utf-8)
  
;;work path
; (setq default-directory "D:/")

;;startup settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;shutdown error bell
(setq visible-bell t)

;;shutdown startup logo
(setq inhibit-startup-message t)

;;disable mouse yank copy
(setq mouse-yank-at-point t)

;;text mode, no fundamental-mode
(setq default-major-mode 'text-mode)

;;column 60
(setq default-fill-column 60)

;;emcas title
(setq frame-title-format "%f - Emacs")

;;no backup files
(setq make-backup-files nil)


;;edit settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;shutdown  M-c toggle case [in]sensitive
;;search 'random' then find result include Random,RANDom, M-c
(setq-default case-fold-search nil)
;;replace from 'tandom' -> 'random' then Random-> Tandom; RANdom -> TANdom
(setq-default case-replace nil)

;;pos settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;show line number
(global-linum-mode t)
;;show column number
(setq column-number-mode t)


;;time settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;24h format
(setq display-time-24hr-format t)
;;show date
(setq display-time-day-and-date t)
;;show time
(display-time-mode 1)

;;set tab
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq-default c-basic-offset 4)
;; some project prefer tab, so be it
;; @see http://stackoverflow.com/questions/69934/set-4-space-indent-in-emacs-in-text-mode
(setq-default tab-width 4)
(setq tab-stop-list())


;;GUI settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;hide menu
(menu-bar-mode -1)
;effective emacs item 7; no scrollbar, no menubar, no toolbar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))


;;'y' or Space key/'n' -> 'yes'/'no'
(fset 'yes-or-no-p 'y-or-n-p)

;;external clipboard interact
(setq x-select-enable-clipboard t)

;;branch highlight
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; http://forum.ubuntu.org.cn/viewtopic.php?p=2910953
;; auto pair mode
(electric-pair-mode t)
(electric-indent-mode t)
(electric-layout-mode t)

;;show pic
(setq auto-image-file-mode t)

;; NO automatic new line when scrolling down at buffer bottom
(setq next-line-add-newlines nil)

;;add final line
(setq require-final-newline t)

;; enable multiple shell buffer
;; M-x shell/eshell
(defun wcy-shell-mode-auto-rename-buffer (text)  
  (if (eq major-mode 'shell-mode)  
      (rename-buffer  (concat "shell:" default-directory) t)))  
(add-hook 'comint-output-filter-functions'wcy-shell-mode-auto-rename-buffer)  
