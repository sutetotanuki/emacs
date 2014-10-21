;;; c-mode
;; Cの設定
(add-hook
 'c-mode-hook
 (lambda ()
   (setq indent-tabs-mode nil)
   (setq c-basic-offset 2)
   (define-key c-mode-map (kbd "C-c c") 'compile)
 ))
