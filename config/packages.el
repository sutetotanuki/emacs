;;; el-get
;; パッケージ管理ソフト
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (end-of-buffer)
    (eval-print-last-sexp)))

;; ユーザー定義のレシピ
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/recipes")

;; buildinのレシピ参照
; (find-file "~/.emacs.d/el-get/el-get/recipes")


;;; C likeな言語のタブを２タブにする
;;
;; なぜかこれしか２タブにする方法が無かった
;; (setq c-basic-offset 2)とかだと効かなかった。。。
(setq-default c-basic-offset 2)

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

;;; scss-mode
(load "config/packages/scss-mode")

;;; go-mode
(load "config/packages/go-mode")

;;; php-mode
(load "config/packages/php-mode")

;;; sequential-command (C-a C-aしたら先頭にいくやつ)
(el-get 'sync '(sequential-command-config))
(require 'sequential-command-config)
(sequential-command-setup-keys)

;;; undo-tree(redoもできるようにする)
(el-get 'sync '(undo-tree))
(require 'undo-tree)
(global-undo-tree-mode t)
(global-set-key (kbd "M-/") 'undo-tree-redo)

;; 大量のundoに耐えられるようにする
(setq undo-limit 600000)
(setq undo-strong-limit 900000)


;;; yaml-mode
(el-get 'sync '(yaml-mode))

;;; jade-mode
(el-get 'sync '(jade-mode))

;;; lua-mode
(load "config/packages/lua-mode")

;;; gtags
(autoload 'gtags-mode "gtags" "" t)
(setq gtags-mode-hook
      '(lambda ()
         (local-set-key (kbd "M-t") 'gtags-find-tag)
         (local-set-key (kbd "M-r") 'gtags-find-rtag)
         (local-set-key (kbd "M-s") 'gtags-find-symbol)
         (local-set-key (kbd "C-M-r") 'gtags-pop-stack)))

;;: feature-mode
(el-get 'sync '(feature-mode))


;;; mark-multiple (一括変換などリファクタリングに便利)
(el-get 'sync '(mark-multiple))
(require 'inline-string-rectangle)
(global-set-key (kbd "C-x r t") 'inline-string-rectangle)

(require 'mark-more-like-this)
(global-set-key (kbd "C-<") 'mark-previous-like-this)
(global-set-key (kbd "C->") 'mark-next-like-this)
(global-set-key (kbd "C-M-m") 'mark-more-like-this) ; like the other two, but takes an argument (negative is previous)
(global-set-key (kbd "C-*") 'mark-all-like-this)

(add-hook 'sgml-mode-hook
          (lambda ()
            (require 'rename-sgml-tag)
            (define-key sgml-mode-map (kbd "C-c C-r") 'rename-sgml-tag)))


;; smart-compile(ruby を評価出来るようにするやつ)
(el-get 'sync '(smart-compile))
(define-key ruby-mode-map (kbd "C-c c") 'smart-compile)
(add-hook
 'c++-mode-hook
 (lambda ()
   (define-key c++-mode-map (kbd "C-c c") 'smart-compile)
   ))


;; xmlpfilter (rubyで# => の後に評価した結果を表示するやつ)
(require 'rcodetools)
(define-key ruby-mode-map (kbd "C-c C-d") 'xmp)


;; slim-mode
(el-get 'sync '(slim-mode))
(add-to-list 'ac-modes 'slim-mode)

;; haml-mode
(el-get 'sync '(haml-mode))
(add-to-list 'ac-modes 'haml-mode)


;; less-css-mode
(el-get 'sync '(less-css-mode))


;; json-mode
;;(el-get 'sync '(json-mode))

;; coffee-mode
(el-get 'sync '(coffee-mode))
(define-key coffee-mode-map (kbd "C-M-h") 'backward-kill-word)

;; scala-mode2
(el-get 'sync '(scala-mode2))

;; web-mode
(load "config/packages/web-mode")



;; display-bufferの挙動を変える
;; (el-get 'sync '(popwin))
;; (require 'popwin)
;; (popwin-mode 1)
