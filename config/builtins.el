;;; ビルドインのモジュールに対する設定

;;; cc-mode
(load "config/builtins/cc-mode")


;;; uniquify (バッファ名が被った時にわかりやすくする)
(require 'uniquify)
;; finename<dir>の形式にする
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; *で囲まれたバッファ名は対象外にする
(setq uniquify-ignore-buffers-rs "*[^*]+*")