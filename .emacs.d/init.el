(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(load "~/.emacs.d/custom/config.el")


;; this is the entrypoint into my emacs config
;; most everything is configured via use-package
(load-custom-config)

(use-package exec-path-from-shell :ensure t)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
(setq shell-file-name "/bin/bash")

(use-package eval-sexp-fu
  :ensure t
  :config
  (eval-sexp-fu-flash-mode))

;; ==================================================
;; ===============End Custom Config==================
;; ==================================================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(autopair-global-mode t)
 '(package-selected-package
   (quote
    (evil-commentary company-go company-quickhelp company rainbow-delimiters which-key swiper ivy projectile doom-themes evil-leader evil use-package)))
 '(package-selected-packages
   (quote
    (company-lisp company-elisp slime-elisp aggressive-indent aggresive-indent aggresive-indent-mode slime-company slime eval-sexp-fu prettier-js prettier-js-mode typescript-mode javascript-mode typescript javascript ts-mode js-mode vue-mode vmd-mode multimarkdown markdown-mode counsel counsel-mode terraform-mode evil-magit magit flycheck exec-path-from-shell treemacs-projectile treemacs-evil treemacs evil-commentary company-go company-quickhelp company rainbow-delimiters which-key swiper ivy projectile doom-themes evil-leader evil use-package)))
 '(projectile-mode t nil (projectile)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
