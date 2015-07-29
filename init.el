;;; ロードパスの追加
(setq load-path (append
                 '("~/.emacs.d")
                 '("~/.emacs.d/config/sitelisp")
                 load-path))


;;; 日本語環境設定
;; Localeにあわせた環境の設定
(set-locale-environment nil)


;;; キーバイド
(global-set-key (kbd "C-M-h") 'backward-kill-word)     ; Word単位でバックスペース
(global-set-key (kbd "C-h")   'delete-backward-char)   ; バックスペース
(global-set-key (kbd "M-g")   'goto-line)              ; 指定行にジャンプ
(global-set-key (kbd "C-t")   'other-window)           ; ウインドウ移動
;; elispの関数や変数定義をとれるfind-functionのキーバインドを有効に
(find-function-setup-keys)


;;; タブ設定
(setq-default tab-width 2)            ; タブを２タブに
(setq-default indent-tabs-mode nil)   ; タブをスペースタブに固定


;;; バックアップ
;; バックアップファイルを作らない
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)
(setq backup-inhibited t)
;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)


;;; 表示
;; 行番号表示
(setq linum-format "%4d ")
(global-set-key (kbd "M-<f8>") 'global-linum-mode)

;; タイトルバーにファイルパスを表示
(setq frame-title-format (format "%%f - Emacs@%s" (system-name)))

;; yes-or-no => y-or-n
(defalias 'yes-or-no-p 'y-or-n-p)

(if window-system
    (progn
      (tool-bar-mode 0)              ;; ツールバーを表示しない
      (menu-bar-mode -1)             ;; メニューバーを表示しない
      (set-background-color "Black") ;; 背景色を黒に
      (set-foreground-color "White") ;; 文字色を白に
      (set-cursor-color     "Gray")  ;; カーソルをグレイ
      ))

;; 時間を表示
(display-time)

;; 括弧をハイライト
(show-paren-mode t)

;; キーストロークをエコーエリアに素早く表示する
(setq echo-keystrokes 0.1)

;; 最初のwelcome画面を出さない
(setq inhibit-startup-message t)


;;; 音
;; ビープ音、画面フラッシュなし
(setq visible-bell t)
(setq ring-bell-funciton 'ignore)


;;; 色
;; 正規表現の\の色替え
(set-face-foreground 'font-lock-regexp-grouping-backslash "green3")
(set-face-foreground 'font-lock-regexp-grouping-construct "green")


;; 行末のスペースに色をつける
(when (boundp 'show-trailing-whitespace)
  (setq-default show-trailing-whitespace t))
(set-face-background 'trailing-whitespace "purple4")


;;; Hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;===================================================
;; 作ったelisp
;;===================================================
(load "functions")


;;===================================================
;; Builtinのパッケージに対する設定
;;===================================================
(load "config/builtins")


;;===================================================
;; 追加の設定
;;===================================================
(load "config/packages")


;;===================================================
;; 環境毎の設定
;;===================================================
(setq darwin-p (eq system-type 'darwin)
      linux-p  (eq system-type 'gnu/linux))

;; 画面サイズ
(load "config/env/screen-size.el")

;; Mac - cocoa
(when darwin-p
  (progn
    (load "config/env/darwin.el")
    ))

;; 個別環境の設定があれば読み込む
(load "config/local" t)

;;===================================================
;; Emacs client(emacsclientコマンドを有効に)
;;===================================================
(require 'server)
(unless (server-running-p)
  (server-start))

;;===================================================
;; Emacs client(emacsclientコマンドを有効に)
;;===================================================
(setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:"
                       (getenv "HOME") "/.rbenv/bin:"
                       (getenv "HOME") "/go/bin:"
                       (getenv "PATH")))
(setenv "GOPATH" (concat (getenv "HOME") "/go"))
(setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims")
                      (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))
(add-to-list 'exec-path (concat (getenv "HOME") "/go/bin" ))


(defun reload-chrome ()
  (interactive)
  (shell-command "osascript ~/.emacs.d/applescript/reload-chrome.scpt"))
(global-set-key (kbd "C-<f5>") 'reload-chrome)

(defun page-down-chrome ()
  (interactive)
  (shell-command "osascript ~/.emacs.d/applescript/page-down-chrome.scpt"))
(global-set-key (kbd "C-<f6>") 'page-down-chrome)

(defun page-up-chrome ()
  (interactive)
  (shell-command "osascript ~/.emacs.d/applescript/page-up-chrome.scpt"))
(global-set-key (kbd "C-<f7>") 'page-up-chrome)



;; ;;===================================================
;; ;; 自動生成で追加されたやつ
;; ;;===================================================
;; ;; local variable 云々のエラーをなくす
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(safe-local-variable-values
;;    (quote ((eval ignore-errors "Write-contents-functions is a buffer-local alternative to before-save-hook" (add-hook (quote write-contents-functions) (lambda nil (delete-trailing-whitespace) nil)) (require (quote whitespace)) "Sometimes the mode needs to be toggled off and on." (whitespace-mode 0) (whitespace-mode 1)) (whitespace-line-column . 80) (whitespace-style face trailing lines-tail) (require-final-newline . t)))))
;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  )
