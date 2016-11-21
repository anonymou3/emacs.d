Based on https://github.com/redguardtoo/emacs.d.git

Simple emacs conf

Directory structural hierarchy  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.emacs.d

    init.el                         Emacs startup file

    custom.el                       Custom environmental variable settings

    lisp------                      Elpa package init-file, named: init_module_name.el
              |---init-elpa.el      Load elpa package official plugins
              |
              |---init-ivy.el       ;; C-x C-r          open recent files list
              |                     ;; C-x C-d          open recent directories list
              |                     ;; C-x w            clear recent files and directories list
              |
              |---init-global-key-map.el
                                    Contains lots of quick-key bindings by myself
                                    ;; C-M-n/p       scroll multiple lines, here is 5 lines
                                    ;; C-w           delete current line in any position
                                    ;; M-w           copy current line without need to select line
                                    ;; C-x c         copy words at point into kill-ring
                                    ;; C-x m         mark current word
                                    ;; F11           toggle set windows transparent effect, test in win7
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

    site-lisp------                 Load not in elpa package unofficial custom plugins
                   |---window-numbering
                                    ;; M-1/M-2/...  multiple windows quick switch

<span style="color:red">
;;;; !!!!ATTENTION!!!! ;;;;  
create new file in ido mode

                                    ;; C-x C-f C-f kick out ido mode into normal find file mode
                                    ;; or
                                    ;; C-x C-f C-j confirm immediately
