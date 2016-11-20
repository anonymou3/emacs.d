Based on https://github.com/redguardtoo/emacs.d.git

Simple emacs conf

Directory structural hierarchy
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.emacs.d
            init.el                         Emacs startup file

            custom.el                       Custom environmental variable settings

            lisp------                      Elpa package init-file, named: init_module_name.el
                      |---init-elpa.el      Load elpa package official plugins
                      |---init-exec-path.el Execute path setting
                      |---init-ivy.el       C-x C-r open recent files list, C-x C-d open recent directories list,
                                            C-x w clear recent files and directories list

                      |---init-global-key-map.el
                                            Contains lots of quick-key setting by myself
                                            ;; C-M-next/previous scroll multiple lines
                                            ;; C-w delete current line in any position
                                            ;; M-w copy current line without need to select line
                                            ;; C-x c copy words at point into kill-ring
                                            ;; C-x m Mark current word
                                            ;; F11 toggle set windows transparent effect, test work for windows7
                                            ;; C-z jump cursor to the line middle pos
                                            ;; M-; Improved!
                                               if at line tail then tail comment, otherwise comment current line
                                               if select a region then comment the region
                                            ;; Press C when scroll mouse middle button font size adjust
                                            ;; C-tab switch buffers

                                            ;; window operate
                                            ;; ` - split-window-below
                                            ;; ` | split-window-right
                                            ;; ` d delete-window
                                            ;; ` <left> windmove-left
                                            ;; ` <down> windmove-down
                                            ;; ` <up> windmove-up
                                            ;; ` <right> windmove-right

                                            ;; window size adjust
                                            ;; C-c left shrink-window-horizontally)
                                            ;; C-c right enlarge-window-horizontally)
                                            ;; C-c up shrink-window)
                                            ;; C-c down enlarge-window)

            site-lisp------                 Load not in elpa package unofficial plugins that made by myself or others
                           |---             window-numbering multiple windows quick switch M-1/M-2/etc..
