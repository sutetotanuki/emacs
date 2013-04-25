(el-get 'sync '(scss-mode))

(defun my-css-electric-pair-brace ()
  (interactive)
  (insert "{") (newline-and-indent)
  (newline-and-indent)
  (insert "}")
  (indent-for-tab-command)
  (previous-line) (indent-for-tab-command)
  )

(add-hook 'scss-mode-hook 'ac-css-mode-setup)
(add-hook 'scss-mode-hook
          (lambda ()
            (define-key scss-mode-map (kbd "{") 'my-css-electric-pair-brace)
            (setq css-indent-offset 2)
            (setq scss-compile-at-save nil)
            (setq ac-sources '(
                               ac-source-words-in-all-buffer
                               ac-source-dictionary
                               ))
            ))

(add-to-list 'ac-modes 'scss-mode)
