;;;
(cscope-setup)

;;linux code style
(defun c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
         (column (c-langelem-2nd-pos c-syntactic-element))
         (offset (- (1+ column) anchor))
         (steps (floor offset c-basic-offset)))
    (* (max steps 1)
       c-basic-offset)))

(add-hook 'c-mode-common-hook
          (lambda ()
            ;; Add kernel style
            (c-add-style
             "linux-tabs-only"
             '("linux" (c-offsets-alist
                        (arglist-cont-nonempty
                         c-lineup-gcc-asm-reg
                         c-lineup-arglist-tabs-only))))))

(defun mz-c-mode-hook ()
  ;;  (setq c-indent-level 4)
  ;;  (setq c-basic-offset 4)
  (setq indent-tabs-mode t)
  (show-paren-mode 1)
  (c-set-style "linux-tabs-only")
  )

(add-hook 'c-mode-hook 'mz-c-mode-hook)
(add-hook 'c++-mode-hook 'mz-c-mode-hook)

(provide 'init-local)
