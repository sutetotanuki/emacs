;;===================================================
;; フォント
;;   あああいいいい花子花子
;;   01234abc
;;===================================================
(set-face-attribute 'default
		    nil
		    :family "Ricty"
		    :height my-screen-font-height)

(set-fontset-font nil
		  'japanese-jisx0208
		  (font-spec :family "Ricty"))

;; アンチエイリス
(setq mac-allow-anti-aliasing t)

;; 画面の透過設定
(set-frame-parameter nil 'alpha 90)