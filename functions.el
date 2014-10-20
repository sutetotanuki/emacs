(defun copy-to-osx (text)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(defun make-n-length-string (n)
  (let ((text "") (i 0))
    (while (< i n)
      (setq text (concat text "a"))
      (setq i (+ i 1)))
    text
    ))

(defun copy-n-length-string-to-osx (n)
  (interactive "n文字長: ")
  (copy-to-osx (make-n-length-string n))
  )
