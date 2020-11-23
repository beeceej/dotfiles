(defun load-custom-config/lang/js ()
  (use-package tide
    :ensure t
    :after (typescript-mode company flycheck)
    :hook ((typescript-mode . tide-setup)
	   (typescript-mode . tide-hl-identifier-mode)))
  (defun setup-tide-mode ()
    "Setup function for tide."
    (interactive)
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1)
    (company-mode +1))

  (setq company-tooltip-align-annotations t)

  (add-hook 'js-mode-hook #'setup-tide-mode)
  (add-hook 'js-mode-hook 'prettier-js-mode)
  (setq prettier-js-args '(
			   "--arrow-parens" "always"
			   "--trailing-comma" "es5"
			   "--bracket-spacing" "true"
			   "--single-quote" "true"
			   "--jsx-single-quote" "true"
			   "--jsx-bracket-same-line" "true"
			   "--print-width" "100"))
  )
