(el-get 'sync '(maxframe))

;; 起動時に最大化
(add-hook 'window-setup-hook 'maximize-frame t)