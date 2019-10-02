(load "~/.emacs.d/custom/lang/elisp.el")
(load "~/.emacs.d/custom/lang/go.el")
(load "~/.emacs.d/custom/lang/terraform.el")
(load "~/.emacs.d/custom/lang/markdown.el")
(load "~/.emacs.d/custom/lang/vue.el")
(load "~/.emacs.d/custom/lang/js.el")
(load "~/.emacs.d/custom/lang/ts.el")

(defun load-custom-config/lang ()
  (load-custom-config/lang/elisp)
  (load-custom-config/lang/go)
  (load-custom-config/lang/terraform)
  (load-custom-config/lang/markdown)
  (load-custom-config/lang/vue)
  (load-custom-config/lang/js)
  (load-custom-config/lang/ts)
  (load-custom-config/lang--tool-prettier))

(defvar prettier-enabled-modes '(typescript-mode-hook vue-mode-hook))
(defun load-custom-config/lang--tool-prettier ()
  (use-package prettier-js
    :ensure t
    :config
    (dolist (hook prettier-enabled-modes)
      (add-hook hook 'prettier-js-mode))))