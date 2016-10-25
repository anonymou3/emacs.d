Based https://github.com/redguardtoo/emacs.d.git

简单的emacs个人配置

目录结构层次如下
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.emacs.d
            init.el                         emacs配置启动文件

            custom.el                       个人环境变量设置

            lisp------                      elpa包管理器相应的init文件，命名：init_module_name.el
                      |---init-elpa.el      加载各elpa包管理器可下载的插件
                      |---init-exec-path.el path环境设置


            site-lisp------                 不包含在elpa中的插件
                           |---             window-numbering 多窗口切换M-1/M-2/etc..
