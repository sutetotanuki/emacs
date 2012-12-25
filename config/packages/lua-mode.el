(el-get 'sync '(lua-mode))

(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(add-hook
 'lua-mode
 '(lambda ()
    (define-key lua-mode-map (kbd "C-M-h" 'backward-kill-word)
      )))