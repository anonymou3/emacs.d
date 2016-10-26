;; Fix error: "X windows are not in use or not initialized"
;; Ref https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=4000

(if (not (x-display-color-p)) ; if-part
    (progn
      (set-face-attribute 'default nil :family "Consolas")
      (set-face-attribute 'default nil :height 135)
      ) ; then-part
  (progn
    (require 'font-set)
    (qiang-set-font
     '("Consolas" "Monaco" "DejaVu Sans Mono" "Monospace" "Courier New") ":pixelsize=18"
     '("Microsoft Yahei" "文泉驿等宽微米黑" "黑体" "新宋体" "宋体"))
    ))   ; else-part

(provide 'init-font-set)
