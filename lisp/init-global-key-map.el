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


;;https://www.emacswiki.org/emacs/CopyWithoutSelection#toc2
(defun get-point (symbol &optional arg)
  "get the point"
  (funcall symbol arg)
  (point)
  )

(defun copy-thing (begin-of-thing end-of-thing &optional arg)
  "copy thing between beg & end into kill ring"
  (save-excursion
    (let ((beg (get-point begin-of-thing 1))
          (end (get-point end-of-thing arg)))
      (copy-region-as-kill beg end)))
  )

(defun paste-to-mark(&optional arg)
  "Paste things to mark, or to the prompt in shell-mode"
  (let ((pasteMe 
     	 (lambda()
     	   (if (string= "shell-mode" major-mode)
               (progn (comint-next-prompt 25535) (yank))
             (progn (goto-char (mark)) (yank) )))))
    (if arg
        (if (= arg 1)
     		nil
          (funcall pasteMe))
      (funcall pasteMe))
    ))

;; C-x c
(defun copy-word (&optional arg)
  "Copy words at point into kill-ring"
  (interactive "P")
  (copy-thing 'backward-word 'forward-word arg)
  ;;(paste-to-mark arg)
  )
(global-set-key (kbd "C-x c") (quote copy-word))


;; https://www.emacswiki.org/emacs/MarkCommands#toc6
;; Mark current word
;; C-x m
(defun my-mark-current-word (&optional arg allow-extend)
  "Put point at beginning of current word, set mark at end."
  (interactive "p\np")
  (setq arg (if arg arg 1))
  (if (and allow-extend
           (or (and (eq last-command this-command) (mark t))
               (region-active-p)))
      (set-mark
       (save-excursion
         (when (< (mark) (point))
           (setq arg (- arg)))
         (goto-char (mark))
         (forward-word arg)
         (point)))
    (let ((wbounds (bounds-of-thing-at-point 'word)))
      (unless (consp wbounds)
        (error "No word at point"))
      (if (>= arg 0)
          (goto-char (car wbounds))
        (goto-char (cdr wbounds)))
      (push-mark (save-excursion
                   (forward-word arg)
                   (point)))
      (activate-mark))))
(global-set-key (kbd "C-x m") (quote my-mark-current-word))

;; F12 toggle set windows transparent effect, test work for windows7
(global-set-key [(f12)] 'loop-alpha)
;; https://www.emacswiki.org/emacs/TransparentEmacs
;; (set-frame-parameter (selected-frame) 'alpha '(<active> . <inactive>))
;; (set-frame-parameter (selected-frame) 'alpha <both>)
(setq alpha-list '((100 80) (80 60) (60 40) (40 20) (20 10)))
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

;; font size adjust
;; Press C when scroll mouse middle button
;; For Linux
(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease) 
;; For Windows
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

;; C-tab switch buffers
;; http://stackoverflow.com/questions/736004/creating-a-ctrltab-keybinding-in-putty
;; TIP: putty send nothing when press C-tab, do not work for putty
(global-set-key [C-tab] (quote previous-buffer))

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

;;run current script f5
(defun xah-run-current-file ()
  "Execute the current file.
For example, if the current buffer is the file x.py, then it'll call 「python x.py」 in a shell.
The file can be Emacs Lisp, PHP, Perl, Python, Ruby, JavaScript, Bash, Ocaml, Visual Basic, TeX, Java, Clojure, Lua.
File suffix is used to determine what program to run.

If the file is modified or not saved, save it automatically before run.

URL `http://ergoemacs.org/emacs/elisp_run_current_file.html'
version 2016-01-28"
  (interactive)
  (let (
         (-suffix-map
          ;; (‹extension› . ‹shell program name›)
          `(
            ("php" . "php")
            ("pl" . "perl")
            ("py" . "python")
            ("py3" . ,(if (string-equal system-type "windows-nt") "c:/Python32/python.exe" "python3"))
            ("rb" . "ruby")
            ("go" . "go run")
            ("js" . "node") ; node.js
            ("sh" . "bash")
            ("clj" . "java -cp /home/xah/apps/clojure-1.6.0/clojure-1.6.0.jar clojure.main")
            ("rkt" . "racket")
            ("ml" . "ocaml")
            ("vbs" . "cscript")
            ("tex" . "pdflatex")
            ("latex" . "pdflatex")
            ("java" . "javac")
            ;; ("pov" . "/usr/local/bin/povray +R2 +A0.1 +J1.2 +Am2 +Q9 +H480 +W640")

            ;; new added
            ("awk" . "bash")
            ("lua" . "lua")
            ;; only work in windows
            ("vbe" . "cscript.exe")
            ("cmd" . "cmd.exe /c")
            ("bat" . "cmd.exe /c")
            ("cs" . "csc.exe")
            ))

         -fname
         -fSuffix
         -prog-name
         -cmd-str)

    (when (null (buffer-file-name)) (save-buffer))
    (when (buffer-modified-p) (save-buffer))

    (setq -fname (buffer-file-name))
    (setq -fSuffix (file-name-extension -fname))
    (setq -prog-name (cdr (assoc -fSuffix -suffix-map)))
    (setq -cmd-str (concat -prog-name " \""   -fname "\""))

    (cond
     ((string-equal -fSuffix "el") (load -fname) (view-echo-area-messages))
     ((string-equal -fSuffix "c")(gdb (gud-query-cmdline 'gdb)))
     ((string-equal -fSuffix "cxx")(gdb (gud-query-cmdline 'gdb)))
     ((string-equal -fSuffix "cpp")(gdb (gud-query-cmdline 'gdb)))
     ((string-equal -fSuffix "java")
      (progn
        (shell-command -cmd-str "*xah-run-current-file output*" )
        (shell-command
         (format "java %s" (file-name-sans-extension (file-name-nondirectory -fname))))))
     (t (if -prog-name
            (progn
              (message "Running…")
              (shell-command -cmd-str "*xah-run-current-file output*" ))
          (message "No recognized program file suffix for this file."))))))

(global-set-key (kbd "<f5>") 'xah-run-current-file)

;; sync upload directory
(defun upload ()
  (interactive)
  (message (file-name-directory (buffer-file-name)))
  (shell-command (concat "bypy syncup " (file-name-directory (buffer-file-name)))))
(global-set-key (kbd "C-x C-p") 'upload)

;; upload single file
(global-set-key (kbd "C-x C-i")
                (lambda ()
                  (interactive)
                  (shell-command (concat "bypy upload " buffer-file-name))))

(provide 'init-global-key-map)
