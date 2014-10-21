;;; ビルドインのモジュールに対する設定

;;; cc-mode
(load "config/builtins/cc-mode")


;;; c-mode
(load "config/builtins/c-mode")


;;; c++-mode
(load "config/builtins/c++-mode")

;;; js-mode(JSON開くとjs-modeが使われる)
(load "config/builtins/js-mode")


;;; c-mode
(add-hook 'c-mode-hook
          (lambda ()
            (define-key c-mode-map (kbd "C-M-h") 'backward-kill-word)))


;;; uniquify (バッファ名が被った時にわかりやすくする)
(require 'uniquify)
;; finename<dir>の形式にする
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; *で囲まれたバッファ名は対象外にする
(setq uniquify-ignore-buffers-rs "*[^*]+*")
