(defun load-custom-config/lang/python ()
  (use-package elpy
    :ensure t
    :defer t
    :init
    :config
    (setq python-shell-interpreter "python")
    (setq python-check-command "pylint")
    (setq elpy-modules (remq 'elpy-module-highlight-indentation elpy-modules))
    (setq elpy-modules (remq 'elpy-module-flymake elpy-modules))
    (setq elpy-rpc-python-command python-shell-interpreter)
    (elpy-enable))
  (use-package python-black
    :ensure t
    :after python
    :init
    (add-hook 'python-mode-hook #'python-black-on-save-mode)))
