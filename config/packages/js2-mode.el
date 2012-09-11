(el-get 'sync '(moz-js2-mode))

(add-hook
 'js2-mode-hook
 '(lambda ()
    (define-key js2-mode-map (kbd "C-M-h") 'backward-kill-word)
    ))
