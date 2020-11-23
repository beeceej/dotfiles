(defun load-custom-config/lang/lsp ()
  (use-package lsp-mode
    :hook (
	   ;; replace XXX-mode with concrete major-mode(e. g. python-mode)
	   (go-mode . lsp)
	   ;; if you want which-key integration
	   (lsp-mode . lsp-enable-which-key-integration))
    :commands lsp)

  (defun lsp-go-install-save-hooks ()
    (add-hook 'before-save-hook #'lsp-format-buffer t t)
    (add-hook 'before-save-hook #'lsp-organize-imports t t))
  (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
  (use-package lsp-ui :commands lsp-ui-mode)
  (use-package lsp-ivy :commands lsp-ivy-workspace-symbol))
