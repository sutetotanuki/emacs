;;; cc-mode
;; C言語派生の言語の基本設定
(add-hook
 'c-mode-common-hook
 (lambda ()
   ;; スペースでインデント
   (setq indent-tabs-mode nil)

   ;; インデント幅を２にする
   (setq c-basic-offset 2)

   ;; 自動改行(auto-newline)と
   ;; 連続する空白の一括削除を有効にする
   (c-toggle-hungry-state 1)

   ;; Camel Case でも分解して編集する
   (subword-mode 1)

   ;; gtags-modeを有効にする。
   (gtags-mode 1)
   (gtags-make-complete-list)
   ))