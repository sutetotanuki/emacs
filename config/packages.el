;;; el-get
;; パッケージ管理ソフト
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (end-of-buffer)
    (eval-print-last-sexp)))

;; buildinのレシピ参照
; (find-file "~/.emacs.d/el-get/el-get/recipes")


;;; C likeな言語のタブを２タブにする
;; 
;; なぜかこれしか２タブにする方法が無かった
;; (setq c-basic-offset 2)とかだと効かなかった。。。
(setq-default c-basic-offset 2)


;; ユーザー定義のレシピ
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/recipes")

;;; anything
(load "config/packages/anything")

;;; autocomplete
(load "config/packages/auto-complete")

;;; recent-f (最近のファイルを開く)
(load "config/packages/recentf")

;;; open-junk-file (試行錯誤用ファイルを開く)
(load "config/packages/open-junk-file")

;;; lispxmp C-c C-d を押すと注釈
(load "config/packages/lispxmp")

;;; paredit (Lispの括弧の対応して編集)
(load "config/packages/paredit")

;;; ruby-mode
(load "config/packages/ruby-mode")

;;; maxframe (画面を最大化)
(load "config/packages/maxframe")

;;; yasnippet (スニペット)
(load "config/packages/yasnippet")

;;; js2-mode
(load "config/packages/js2-mode")