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

;; ==================================================
;; ===============End Custom Config==================
;; ==================================================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-package
   (quote
    (evil-commentary company-go company-quickhelp company rainbow-delimiters which-key swiper ivy projectile doom-themes evil-leader evil use-package)))
 '(package-selected-packages
   (quote
    (evil-magit magit flycheck exec-path-from-shell treemacs-projectile treemacs-evil treemacs evil-commentary company-go company-quickhelp company rainbow-delimiters which-key swiper ivy projectile doom-themes evil-leader evil use-package)))
 '(projectile-mode t nil (projectile)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
