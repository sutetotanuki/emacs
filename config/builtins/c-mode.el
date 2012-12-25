;;; c-mode
;; Cの設定
(add-hook
 'c-mode-hook
 (lambda ()
   (setq indent-tabs-mode nil)
   (setq c-basic-offset 4)
 ))