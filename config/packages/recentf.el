(el-get 'sync '(recentf-ext))

;; 最近のファイルの保存数
(setq recentf-max-saved-items 1000)
;; 最近のファイルに含めないファイルを指定
;(setq recentf-exclude '(".*"))

(require 'recentf-ext)

(global-set-key (kbd "M-]") 'recentf-open-files)