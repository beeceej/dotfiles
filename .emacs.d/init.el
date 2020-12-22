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

(setq-default bidi-paragraph-direction 'left-to-right)
(if (version<= "27.1" emacs-version)
    (setq bidi-inhibit-bpa t))

(if (version<= "27.1" emacs-version)
    (global-so-long-mode 1))

(use-package eval-sexp-fu
  :ensure t
  :config
  (eval-sexp-fu-flash-mode))
;; LSP



(setq gc-cons-threshold 500000000)
(setq read-process-output-max (* 1024 1024)) ;;1mb
(setq lsp-print-io t)

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
   '(evil-commentary company-go company-quickhelp company rainbow-delimiters which-key swiper ivy projectile doom-themes evil-leader evil use-package))
 '(package-selected-packages
   '(sbt-mode scala-mode t: tide-mode tide projectile-ripgrep tuareg elm-mode lsp-haskell lsp-ui lsp-mode haskell-mode rust-mode forth-mode python-black docker dockerfile auto-package-update dockerfile-mode graphviz-dot-mode eval-sexp-fu graph-viz-dot-mode slime aggressive-indent slime-company evil-surround prettier-js prettier-js-mode typescript-mode javascript-mode typescript javascript ts-mode js-mode vue-mode vmd-mode multimarkdown markdown-mode counsel counsel-mode terraform-mode evil-magit magit flycheck exec-path-from-shell treemacs-projectile treemacs-evil treemacs evil-commentary company-go company-quickhelp company rainbow-delimiters which-key swiper ivy projectile doom-themes evil-leader evil use-package))
 '(projectile-mode t nil (projectile))
 '(safe-local-variable-values
   '((haskell-process-use-ghci . t)
     (haskell-indent-spaces . 4))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
