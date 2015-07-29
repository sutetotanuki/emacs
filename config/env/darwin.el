;;===================================================
;; フォント
;;   あああいいいい花子花子
;;   01234abc
;;===================================================
(set-face-attribute 'default
		    nil
		    :family "Ricty"
		    :height 145)

(set-fontset-font nil
		  'japanese-jisx0208
		  (font-spec :family "Ricty"))

;; アンチエイリス
(setq mac-allow-anti-aliasing t)

;; 画面の透過設定
(set-frame-parameter nil 'alpha 90)

;; Apple scripts
(defun chrome-reload()
  (interactive)
  (shell-command "osascript ~/scripts/chrome_ctrl.scpt reload"))

(global-set-key (kbd "C-c <f5>") 'chrome-reload)


;; dockからとか普通のAppとして立ち上げたときに shell のpathを引き継がないので読み込む
(let ((path-str
       (replace-regexp-in-string
        "\n+$" "" (shell-command-to-string "echo $PATH"))))
  (setenv "PATH" path-str)
  (setq exec-path (nconc (split-string path-str ":") exec-path '("/usr/local/bin")))) ; /usr/local/binだけはだめだった orz


;; 横に分割されるとpathが長いときに端っこ見えないから
;; *Help*バッファを横分割に強制する
;; C-t で切り替えられる
(setq split-height-threshold 0)
(setq split-width-threshold nil)


;; ドロップダウンされたときなどに新しいEmacsでファイルを開かない
(setq ns-pop-up-frames nil)

(global-set-key (kbd "C-M-¥") 'indent-region)

;; バックスラッシュを使うショートカットが使えない。。。
(define-key global-map [?\¥] [?\\])
(define-key global-map [?\C-¥] [?\C-\\])
(define-key global-map [?\M-¥] [?\M-\\])
(define-key global-map [?\C-\M-¥] [?\C-\M-\\])
