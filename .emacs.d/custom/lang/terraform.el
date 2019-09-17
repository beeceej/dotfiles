(defun load-custom-config/lang/terraform ()
  "Enable/install terraform mode"
  (use-package terraform-mode
    :ensure t
    :config
    (add-hook 'before-save-hook 'terraform-format-buffer)))
