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
(setq ring-bell-funciton 'ignore)



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
;; 自動生成で追加されたやつ
;;===================================================
;; local variable 云々のエラーをなくす
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   (quote ((eval ignore-errors "Write-contents-functions is a buffer-local alternative to before-save-hook" (add-hook (quote write-contents-functions) (lambda nil (delete-trailing-whitespace) nil)) (require (quote whitespace)) "Sometimes the mode needs to be toggled off and on." (whitespace-mode 0) (whitespace-mode 1)) (whitespace-line-column . 80) (whitespace-style face trailing lines-tail) (require-final-newline . t)))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )



;; (setq byte-compile-warnings '(free-vars unresolved callargs redefine obsolete noruntime cl-functions interactive-only make-local))

;; ;; set window status
;; (if window-system (progn
;; 		    (setq initial-frame-alist'((width . 200)(height . 45)(top . 0)(left . 0)))
;; 		    (set-background-color "Black")
;; 		    (set-foreground-color "White")
;; 		    (set-cursor-color "Gray")
;; 		    ))


;; ;; Newline and ident
;; (global-set-key "\C-m" 'newline-and-indent)


;; ;; Base
;; (setq read-file-name-completion-ignore-case t)
;; (global-font-lock-mode t)
;; (auto-compression-mode t)
;; (setq inhibit-startup-message t)
;; (setq-default tab-width 2 indent-tabs-mode nil)
;; (setq visible-bell t)
;; (show-paren-mode 1)
;; ;; (global-hl-line-mode)
;; (setq require-final-newline t)
;; (tool-bar-mode 0)
;; (setq truncate-partial-width-windwos nil)

;; (savehist-mode 1)
;; (setq-default save-place t)
;; (require 'saveplace)
;; (setq gc-cons-threshold (* 10 gc-cons-threshold))
;; (setq message-log-max 10000)
;; (setq enable-recursive-minibuffers t)
;; (setq use-dialog-box nil)
;; (defalias 'message-box 'message)
;; (setq history-length 1000)

;; (defadvice abort-recursive-edit (before minibuffer-save activate)
;;   (when (eq (selected-window) (active-minibuffer-window))
;;     (add-to-history minibuffer-history-variable (minibuffer-contents))))


;; (global-set-key (kbd "M-g") 'goto-line)
;; (global-set-key (kbd "M-n") 'next-error)
;; (global-set-key (kbd "M-p") 'previous-error)

;; (require 'jaspace)
;; (setq jaspace-alternate-jaspace-string "□")
;; (setq jaspace-highlight-tabs t)
;; (setq jaspace-highlight-tabs ?^)


;; ;;;;;;;;;;;;;;;;;;;;;;;
;; ;; ruby-mode
;; (add-to-list 'load-path "~/.emacs.d/ruby-mode")
;; (autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)
;; (setq auto-mode-alist (cons '("\\.rb$" . ruby-mode) auto-mode-alist))
;; (setq interpreter-mode-alist (append'(("ruby" . ruby-mode)) interpreter-mode-alist))
;; (autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
;; (autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
;; (add-hook 'ruby-mode-hook '(lambda()(inf-ruby-keys)))

;; ;;;;;;;;;;;;;;;;;;;;;;;
;; ;; ruby-electric
;; (require 'ruby-electric)
;; (add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))

;; ;; set ruby-mode indent
;; (setq ruby-indent-level 2)
;; (setq ruby-indent-tabs-mode nil)
;; (setq ruby-deep-indent-paren-style nil)

;; ;; (require 'ido)
;; ;; (ido-mode t)

;; ;;Rinari
;; (add-to-list 'load-path "~/.emacs.d/rinari")
;; (require 'rinari)



;; ;; るびきちさんのにかえる
;; ;; ;; yasnipeet
;; ;; (add-to-list 'load-path "~/.emacs.d/yasnippet")
;; ;; (require 'yasnippet)
;; ;; (yas/load-directory "~/.emacs.d/yasnippet/snippets")
;; ;; ;; rails
;; ;; (yas/load-directory "~/.emacs.d/yasnippets-rails/rails-snippets")

;; ;; ほかーんほかん
;; (setq yas/trigger-key "M-q")
;; (require 'yasnippet-config)
;; (yas/setup "~/.emacs.d/plugins/yasnippet-0.6.1c")
;; (global-set-key (kbd "C-x y") 'yas/register-oneshot-snippet)
;; (global-set-key (kbd "C-x C-y") 'yas/expand-oneshot-snippet)

;; (defun my-yas/prompt (prompt choices &optional display-fn)
;;   (let* ((names (loop for choice in choices
;;                       collect (or (and display-fn (funcall display-fn choice))
;;                                   coice)))
;;          (selected (anything-other-buffer
;;                     `(((name . ,(format "%s" prompt))
;;                        (candidates . names)
;;                        (action . (("Insert snippet" . (lambda (arg) arg))))))
;;                     "*anything yas/prompt*")))
;;     (if selected
;;         (let ((n (position selected names :test 'equal)))
;;           (nth n choices))
;;       (signal 'quit "user quit!"))))
;; (custom-set-variables '(yas/prompt-functions '(my-yas/prompt)))


;; ;; ecb
;; ;;(require 'ecb)
;; ;;(defun ecb-toggle ()
;; ;;    (interactive)
;; ;;        (if ecb-minor-mode
;; ;;	            (ecb-deactivate)
;; ;;	        (ecb-activate)))
;; ;;(global-set-key[f2] 'ecb-toggle)

;; ;; windows
;; (setq win:switch-prefix "\C-z")
;; (define-key global-map win:switch-prefix nil)
;; (define-key global-map "\C-z1" 'win-switch-to-window)

;; (require 'windows)
;; (setq win:use-frame nil)
;; (win:startup-with-window)
;; (define-key ctl-x-map "C" 'see-you-again)

;; (load-library "tails-comint-history")

;; ;; windmove
;; (windmove-default-keybindings)
;; (setq windmove-wrap-around t)

;; (autoload 'js2-mode "js2-mode" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; (add-hook 'js2-mode-hook
;;  (lambda ()
;;    (define-key js2-mode-map (kbd "C-M-h") 'backward-kill-word)))
   

;; (require 'sequential-command-config)
;; (sequential-command-setup-keys)

;; ;; minor-mode-hack
;; (require 'minor-mode-hack)

;; (require 'uniquify)
;; (setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;; (setq uniquify-ignore-buffers-rs "*[^*]+*")

;; (setq recentf-max-saved-items 500)
;; (setq recentf-max-exclude '("/TAGS$" "/var/tmp"))
;; (require 'recentf-ext)
;; (global-set-key (kbd "M-]") 'recentf-open-files)

;; ;; 自動バッファ削除
;; (require 'tempbuf)
;; (add-hook 'find-file-hooks 'turn-on-tempbuf-mode)
;; (add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)

;; ;; カーソル戻す
;; (require 'point-undo)
;; (define-key global-map (kbd "<f7>") 'point-undo)
;; (define-key global-map (kbd "S-<f7>") 'point-redo)

;; ;; 変更箇所にとぶ
;; (require 'goto-chg)
;; (define-key global-map (kbd "<f8>") 'goto-last-change)
;; (define-key global-map (kbd "S-<f8>") 'goto-last-change-reverse)

;; ;; やりなおしなおし
;; (require 'redo+)
;; (global-set-key (kbd "C-M-/") 'redo)
;; (setq undo-no-redo t) ; 過去のundoがredoされないようにする？らしい
;; ;; 大量のundoに耐えれるようにする
;; (setq undo-limit 600000)
;; (setq undo-strong-limit 900000)

;; ;; alt + backspaceめんどい
;; (global-set-key (kbd "C-M-h") 'backward-kill-word)
;; (define-key ruby-mode-map (kbd "C-M-h") 'backward-kill-word)
;; (add-hook 'c-mode-hook
;;           (lambda ()
;;             (define-key c-mode-map (kbd "C-M-h") 'backward-kill-word)))
;; ;;(define-key c-mode-map "\C-\M-h" 'backward-kill-word)

;; ;; 矩形
;; (require 'sense-region)
;; (sense-region-on)

;; ;; jadeモード
;; (require 'sws-mode)
;; (require 'jade-mode)
;; (add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
;; (add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;; ;; めも
;; (require 'org)
;; (org-remember-insinuate)
;; (setq org-directory "~/memo/")
;; (setq org-default-notes-file (expand-file-name "memo.org" org-directory))

;; (setq org-remember-templates
;;       '(("Note" ?n "** %?\r   %i\n  %a\n   %t" nil "Inbox")
;;         ("Todo" ?t "** TODO %?\n   %i\n   %a\n   %t" nil "Inbox")))

;; ;; 矩形選択
;; (cua-mode t)
;; (setq cua-enable-cua-keys nil)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; ELISP勉強用
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; 試行錯誤用？
;; (require 'open-junk-file)
;; ;; C-x C-zで試行錯誤用のファイルを開く
;; (global-set-key (kbd "C-x C-z") 'open-junk-file)
;; ;; 式の評価結果を注釈
;; (require 'lispxmp)
;; ;; emacs-lisp-mode でC-c C-dを押すと注釈
;; (define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp)
;; ;; 括弧の対応を保持して編集する
;; (require 'paredit)
;; (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
;; (add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
;; (add-hook 'lisp-mode-hook 'enable-paredit-mode)
;; (add-hook 'ielm-mode-hook 'enable-paredit-mode)
;; (require 'auto-async-byte-compile)
;; ;; 自動バイトコンパイルを無効にするファイル名の正規表現
;; (setq auto-async-byte-compile-exclude-files-regexp "/junk/")
;; (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
;; (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
;; (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
;; (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
;; (setq eldoc-idle-delay 0.2) ; すぐ表示
;; (setq eldoc-minor-mode-string "") ;モードラインにELDocと表示しない
;; ;; 釣り合いのとれる括弧をハイライトする
;; (show-paren-mode 1)
;; (find-function-setup-keys)

;; ;;; cssモード
;; (setq cssm-indent-level 2)
;; (setq cssm-indent-function #'cssm-c-style-indenter)

;; ;; jsx-mode
;; (add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
;; (autoload 'jsx-mode "jsx-mode" "JSX mode" t)

;; ;;; imenu
;; (require 'imenu)
;; (defcustom imenu-modes
;;   '(emacs-lisp-mode c-mode c++-mode makefile-mode)
;;   "List of major modes for which Imenu mode should be used."
;;   :group 'imenu
;;   :type '(choice (const :tag "All modes" t)
;;                  (repeat (symbol :tag "Major mode"))))
;; (defun my-imenu-ff-hook ()
;;   "File find hook for Imenu mode."
;;   (if (member major-mode imenu-modes)
;;       (imenu-add-to-menubar "imenu")))
;; (add-hook 'find-file-hooks 'my-imenu-ff-hook t)

;; (global-set-key "\C-cg" 'imenu)

;; ;; js-mode
;; ;; (add-hook 'js-mode-hook
;; ;;           '(lambda()
;; ;;              (setq js-indent-level 2)
;; ;;              (local-set-key "C-M-h" 'delete-backward-char)))

;; ;; eshell拡張
;; (defun eshell-clear ()
;;   "Clear the current buffer, leaving one prompt at the top"
;;   (interactive)
;;   (let ((inhibit-read-only t))
;;     (erase-buffer)))

;; (add-hook 'shell-script-mode
;;           (lambda ()
;;             (message "a")
;;             (define-key shell-mode (kbd "`") 'insert-back-quote)))

;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; ;; 正規表現
;; (set-face-foreground 'font-lock-regexp-grouping-backslash "green3")
;; (set-face-foreground 'font-lock-regexp-grouping-construct "green")

