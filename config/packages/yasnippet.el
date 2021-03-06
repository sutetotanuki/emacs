(el-get 'sync '(yasnippet))
(global-set-key (kbd "C-x y") 'yas/register-oneshot-snippet)
(global-set-key (kbd "C-x C-y") 'yas/expand-oneshot-snippet)
(global-set-key (kbd "M-q") 'yas-expand)


;;; anythingでyasnnipetを開く
(defun my-yas/prompt (prompt choices &optional display-fn)
  (let* ((names (loop for choice in choices
                      collect (or (and display-fn (funcall display-fn choice))
                                  coice)))
         (selected (anything-other-buffer
                    `(((name . ,(format "%s" prompt))
                       (candidates . names)
                       (action . (("Insert snippet" . (lambda (arg) arg))))))
                    "*anything yas/prompt*")))
    (if selected
        (let ((n (position selected names :test 'equal)))
          (nth n choices))
      (signal 'quit "user quit!"))))
(custom-set-variables '(yas/prompt-functions '(my-yas/prompt)))


;;; リロードが必要？
;(yas-reload-all)


;;; yasnippet有効化
(yas-global-mode 1)

;;; YASnippetをacの補完候補に
(add-to-list 'ac-sources 'ac-source-yasnippet)
