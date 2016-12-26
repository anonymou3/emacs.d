## Simple emacs conf ##

Based on https://github.com/redguardtoo/emacs.d.git

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