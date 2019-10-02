(defun load-custom-config/lang/yaml ()
  (use-package yaml-mode
    :ensure t
    :init
    :config
    (add-hook 'yaml-mode-hook
	      (lambda ()
		(define-key yaml-mode-map "\C-m" 'newline-and-indent)))))
