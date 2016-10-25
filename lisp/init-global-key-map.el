;; open header file under cursor
(global-set-key (kbd "C-x C-o") 'ffap)


;; RET map
(define-key global-map (kbd "RET") 'newline-and-indent)


;; isearch
;; Use regex to search by default
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
(define-key isearch-mode-map (kbd "C-o") 'isearch-occur)


;; C-M-next/previous scroll multiple lines
(global-set-key (kbd "C-M-n")
    (lambda () (interactive) (next-line 5)))
(global-set-key (kbd "C-M-p")
    (lambda () (interactive) (previous-line 5)))


;; C-w delete current line in any position
;; M-w copy current line without need to select line
(defadvice kill-ring-save (before slickcopy activate compile)
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))
(defadvice kill-region (before slickcut activate compile)
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))


;; F11 toggle set windows transparent effect, test work for windows7
(global-set-key [(f11)] 'loop-alpha)
(setq alpha-list '((100 100) (95 65) (85 55) (75 45) (65 35)))
(defun loop-alpha ()
  (interactive)
  (let ((h (car alpha-list)))                ;; head value will set to
    ((lambda (a ab)
       (set-frame-parameter (selected-frame) 'alpha (list a ab))
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))
       ) (car h) (car (cdr h)))
    (setq alpha-list (cdr (append alpha-list (list h))))
    )
)


;; C-z jump cursor to the line middle pos
(defun middle-of-line ()
  "Put cursor at the middle point of the line."
  (interactive)
  (goto-char (/ (+ (point-at-bol) (point-at-eol)) 2)))
(global-set-key (kbd "C-z") 'middle-of-line)


;; M-; Improved!
;; if at line tail then tail comment, otherwise comment current line
;; if select a region then comment the region
(defun qiang-comment-dwim-line (&optional arg)
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key "\M-;" 'qiang-comment-dwim-line)

;;window operate
;;http://emacslife.com/read-lisp-tweak-emacs/beginner-3-make-things-more-convenient.html
;;ref https://www.reddit.com/r/emacs/comments/3ytb6n/a_better_way_to_define_a_new_prefix/
(define-prefix-command 'bt-window-map)
(global-set-key (kbd "`") 'bt-window-map)
(global-set-key (kbd "` `") (lambda () (interactive) (insert "`")))
(global-set-key (kbd "` -") (lambda () (interactive) (split-window-below)))
(global-set-key (kbd "` |") (lambda () (interactive) (split-window-right)))
(global-set-key (kbd "` d") (lambda () (interactive) (delete-window)))
(global-set-key (kbd "` <left>") (lambda () (interactive) (windmove-left)))
(global-set-key (kbd "` <down>") (lambda () (interactive) (windmove-down)))
(global-set-key (kbd "` <up>") (lambda () (interactive) (windmove-up)))
(global-set-key (kbd "` <right>") (lambda () (interactive) (windmove-right)))

;;window size adjust
(define-prefix-command 'ctl-c-map)
(global-set-key [?\C-c] 'ctl-c-map)
(global-set-key [?\C-c left] 'shrink-window-horizontally)
(global-set-key [?\C-c right] 'enlarge-window-horizontally)
(global-set-key [?\C-c up] 'shrink-window)
(global-set-key [?\C-c down] 'enlarge-window)

(provide 'init-global-key-map)
