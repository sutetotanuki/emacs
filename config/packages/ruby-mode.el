(el-get 'sync '(ruby-mode-trunk))
(el-get 'sync '(ruby-block))
;; ruby-debugger
(el-get 'sync '(rdebug-github))


;;; 基本設定
;; 括弧の位置を行頭の近くにする TODO: 出来たら行頭にする
(setq ruby-deep-indent-paren-style nil)

;; インデント設定
(setq ruby-indent-level 2)
(setq ruby-indent-tabs-mode nil)

;; 無意味なスペース(先頭から末尾までスペース)を赤くするのを無効にする
;; (ruby-mode時に自動的に on になっている？)
;; (add-hook
;;  'ruby-mode-hook
;;  (lambda ()
;;    (setq show-trailing-whitespace nil)))

;; C-M-h(単語単位のバックスペース)が上書きされてしまうため再定義
(define-key ruby-mode-map (kbd "C-M-h") 'backward-kill-word)


;; マジックコメントの自動挿入を無効化
(defun ruby-mode-set-encoding () nil)

;;; ruby-electric(対応するendの自動補完など)
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))


;;; ruby-block(endに対するdefを表示する)
;; (require 'ruby-block)
;; (ruby-block-mode t)
;; ;; ミニバッファに表示し, かつ, オーバレイする.
;; (setq ruby-block-highlight-toggle t)


;;=======================================================
;; 構文チェック
;;=======================================================
(require 'flymake)
;; Invoke ruby with '-c’ to get syntax checking
(defun flymake-ruby-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
		     'flymake-create-temp-inplace))
	 (local-file (file-relative-name
		      temp-file
		      (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))

(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)

(add-hook
 'ruby-mode-hook
 '(lambda ()
    (unless (or (and (fboundp 'tramp-tramp-file-p)
                     (tramp-tramp-file-p buffer-file-name))
                (string-match "sudo:.*" (buffer-file-name)))
      (flymake-mode)
      (define-key ruby-mode-map "\C-cd" 'credmp/flymake-display-err-minibuf)))
     )
    ;; ;; Don’t want flymake mode for ruby regions in rhtml files
    ;; (if (not (null buffer-file-name)) (flymake-mode))
    ;; ;; エラー行で C-c d するとエラーの内容をミニバッファで表示する
    ;; (define-key ruby-mode-map "\C-cd" 'credmp/flymake-display-err-minibuf)))

(defun credmp/flymake-display-err-minibuf ()
  "Displays the error/warning for the current line in the minibuffer"
  (interactive)
  (let* ((line-no (flymake-current-line-no))
         (line-err-info-list (nth 0 (flymake-find-err-info flymake-err-info line-no)))
         (count (length line-err-info-list))
         )
    (while (> count 0)
      (when line-err-info-list
        (let* ((file (flymake-ler-file (nth (1- count) line-err-info-list)))
               (full-file (flymake-ler-full-file (nth (1- count) line-err-info-list)))
               (text (flymake-ler-text (nth (1- count) line-err-info-list)))
               (line (flymake-ler-line (nth (1- count) line-err-info-list))))
          (message "[%s] %s" line text)
          )
        )
      (setq count (1- count)))))

; Syntaxチェクがエラーになった時にフリーズするので回避
(defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
  (setq flymake-check-was-interrupted t))
(ad-activate 'flymake-post-syntax-check)
