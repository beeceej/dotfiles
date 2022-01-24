(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(load "~/.emacs.d/custom/config.el")
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
;; this is the entrypoint into my emacs config
;; most everything is configured via use-package
(load-custom-config)

(setq-default bidi-paragraph-direction 'left-to-right)
(if (version<= "27.1" emacs-version)
	(progn
	  (global-so-long-mode 1)
      (setq bidi-inhibit-bpa t)))

(electric-pair-mode)
(setq backup-directory (* 1024 1024)) ;;1mb

(use-package tree-sitter :ensure t :config (global-tree-sitter-mode) (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))
(use-package tree-sitter-langs :ensure t :after tree-sitter)
(use-package php-mode :ensure t)
(use-package go-mode  :ensure t)

;; ==================================================
;; ===============End Custom Config==================
;; ==================================================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae" "cdd26fa6a8c6706c9009db659d2dffd7f4b0350f9cc94e5df657fa295fffec71" "7b1ea77093c438aa5887b2649ca079c896cc8780afef946d3b6c53931081a726" default))
 '(ido-ubiquitous-mode t)
 '(package-selected-package
   '(evil-commentary which-key projectile evil-leader evil use-package))
 '(package-selected-packages
   '(no-littering material-themeido-completing-read-plus ido-completing-read+ tree-sitter-langs go-mode php-mode tree-sitter smex ido-grid-mode evil-collection projectile-ripgrep auto-package-update magit exec-path-from-shell evil-commentary which-key projectile evil-leader evil use-package))
 '(projectile-mode t nil (projectile)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
