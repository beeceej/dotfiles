(defun load-custom-config/lang/go ()
  (use-package go-mode
    :ensure t
    :init
    (progn
      (setq gofmt-command "goimports"))
    :config
    (defun my-go-mode-hook ()
      (add-hook 'before-save-hook 'gofmt-before-save)
      (setq tab-width 4))
    (add-hook 'go-mode-hook 'my-go-mode-hook)))
