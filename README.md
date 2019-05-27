## Simple emacs conf ##

Based on https://github.com/redguardtoo/emacs.d.git

.emacs.d

    init.el                         Emacs startup file

    custom.el                       Custom environmental variable settings

    lisp------                      Elpa package init-file, named: init_module_name.el
              |---init-elpa.el      Load elpa package official plugins
              |
              |---init-helm-projectile.el   project interaction library
              |                     ;; http://tuhdo.github.io/helm-projectile.html
              |                     ;; At first ensure .git directory exist or add .projectile file
              |                     ;; C-c p h  helm-projectile                    Helm interface to projectile
              |                     ;; C-c p p  helm-projectile-switch-project     Switches to another projectile project
              |                     ;; C-c p f  helm-projectile-find-file          Lists all files in a project
              |                     ;; C-c p g  helm-projectile-find-file-dwim     Find file based on context at point
              |                     ;; C-c p d  helm-projectile-find-dir           Lists available directories in current project
              |                     ;; C-c p e  helm-projectile-recentf            Lists recently opened files in current project
              |                     ;; C-c p s g/a/ss helm-projectile-grep/ack/ag  helm-projectile-grep  Searches for symbol starting from project root
              |
              |---init-ivy.el       ;; C-x C-r          open recent files list
              |                     ;; C-x C-d          open recent directories list
              |                     ;; C-x w            clear recent files and directories list
              |
              |---init-git.el
              |                     ;; C-x g            magit-status
              |                     ;; C-x M-g          magit-dispatch-popup
              |                     ;; tips:            Need set git.exe path to PATH in windows.
              |                     ;; s to stage files
              |                     ;; c c to commit (type the message then C-c C-c to actually commit)
              |                     ;; b b to switch to another branch
              |                     ;; Other handy keys:
              |                     ;; P u to do a git push
              |                     ;; F u to do a git pull
              |                     ;; TAB Toggle hidden status of current section
              |---init-winum.el
              |                     ;; M-1/M-2/...      multiple windows quick switch
              |
              |---init-gud.el       ;; PuTTY Terminal->Keyborad->The Function keys and keypad->SCO
              |                     ;; cc xxx.cpp -g -o xxx
              |                     ;; emacs xxx.cpp M-x gdb RET RET
              |                     ;; C-f5  gud-run          run
              |                     ;; S-f5  gud-kill         stop debug
              |                     ;; f7                     compile
              |                     ;; f8    gud-print        print variable
              |                     ;; C-f8  gud-pstar        print point
              |                     ;; f9    gud-break        C-x C-a C-b breakpoint add
              |                     ;; C-f9  gud-remove       C-x C-a C-d breakpoint remove
              |                     ;; f10   gud-next         C-x C-a C-n step over
              |                     ;; C-f10 gud-until        run to the cursor position
              |                     ;; S-f10 gud-jump         run from the cursor position
              |                     ;; f11   gud-step         C-x C-a C-s step into
              |                     ;; C-f11 gud-finish       C-x C-a C-f finish current function
              |
              |---init-global-key-map.el
                                    Contains lots of quick-key bindings by myself
                                    ;; C-M-n/p       scroll multiple lines, here is 5 lines
                                    ;; C-w           delete current line in any position
                                    ;; M-w           copy current line without need to select line
                                    ;; C-x c         copy words at point into kill-ring
                                    ;; C-x m         mark current word
                                    ;; F12           toggle set windows transparent effect, test in win7
                                    ;; C-z           jump cursor to the line middle pos
                                    ;; M-;           improved!
                                                     if at line tail then tail comment,
                                                     otherwise comment current line
                                                     if select a region then comment the region

                                    ;; C(hold)       scroll middle mouse button to adjust font size
                                    ;; C-tab         switch buffers

                                    ;; window operate
                                    ;; ` -           split-window-below
                                    ;; ` |           split-window-right
                                    ;; ` d           delete-window
                                    ;; ` <left>      windmove-left
                                    ;; ` <down>      windmove-down
                                    ;; ` <up>        windmove-up
                                    ;; ` <right>     windmove-right

                                    ;; window size adjust
                                    ;; C-c left      shrink-window-horizontally
                                    ;; C-c right     enlarge-window-horizontally
                                    ;; C-c up        shrink-window
                                    ;; C-c down      enlarge-window

                                    ;; Run most script
                                    ;; F5            run current extension script file, such as .py .sh etc.
                                    ;;               if .c .cxx .cpp call gdb

    site-lisp------                 Load not in elpa package unofficial custom plugins
                   |---

![](https://camo.githubusercontent.com/50e03755d1c1b7eb1f79fd9552c7e764c0331cc3/687474703a2f2f69636f6e732e69636f6e617263686976652e636f6d2f69636f6e732f686f70737461727465722f736f66742d7363726170732f33322f427574746f6e2d5761726e696e672d69636f6e2e706e67)
[Tips
create new file in ido mode](http://stackoverflow.com/questions/5138110/emacs-create-new-file-with-ido-enabled)

                                    ;; C-x C-f C-f kick out ido mode into normal find file mode
                                    ;; or
                                    ;; C-x C-f C-j confirm immediately

Svn checkout/git clone

Windows
1.Double click emacsHome.reg to setup configuration path.
2.cd %HOME% # setup in emacsHome.reg

*nix
1.cd ~

svn co https://github.com/anonymou3/emacs.d.git/trunk .emacs.d
git clone https://github.com/anonymou3/emacs.d.git/ .emacs.d
