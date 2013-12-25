(el-get 'sync '(yasnippet))

;; (custom-set-variables
;;  '(yas/snippet-dirs '("~/.emacs.d/snippets")))
(yas-global-mode t)

;; auto-completeと分けるためにM-q を yas/expand に
(define-key yas-minor-mode-map (kbd "M-q") 'yas-expand)
(define-key yas-minor-mode-map (kbd "TAB") nil)

;; anything interface
(eval-after-load "anything-config"
  '(progn
     (defun my-yas/prompt (prompt choices &optional display-fn)
       (let* ((names (loop for choice in choices
                           collect (or (and display-fn (funcall display-fn choice))
                                       choice)))
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
     (define-key anything-command-map (kbd "y") 'yas/insert-snippet)))

(add-to-list 'auto-mode-alist '("\\.yasnippet$" . snippet-mode))
