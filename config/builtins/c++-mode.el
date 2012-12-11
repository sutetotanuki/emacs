(add-hook
 'c++-mode-hook
 (lambda ()
   (define-key c++-mode-map (kbd "C-M-h") 'backward-kill-word)
   ))