(el-get 'sync '(anything))
(el-get 'sync '(descbinds-anything))

(require 'anything-startup)

;; <f1>-b(コマンドヘルプ)をanythingで行う
(descbinds-anything-install)

(global-set-key (kbd "C-o")   'anything)
(global-set-key (kbd "C-x b") 'anything-for-files)                ;; バッファを開くをanythingで
(global-set-key (kbd "M-x")   'anything-execute-extended-command) ;; M-xをanythingで開く
