;;;; config.el --- custom emacs configuration

;;; Commentary:
;;; sets up all the fun stuff

;;; Code:

;; custom EVIL mode configuration
(load "~/.emacs.d/custom/evil.el")

;; custom magit configuration
(load "~/.emacs.d/custom/magit.el")

;; Programming language configuration
(load "~/.emacs.d/custom/lang.el")

(defun load-custom-config ()
  "Set up custom configuration."

  ;; use-package setup
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))
  (require 'use-package)

  ;; look and feel
  (set-frame-font "jetbrains mono 10")
  (global-linum-mode)
  (blink-cursor-mode 0)
  (global-hl-line-mode)
  (menu-bar-mode -1)
  (toggle-scroll-bar -1)
  (tool-bar-mode -1)
  (show-paren-mode 1)
  (use-package doom-themes
    :ensure t
    :config (load-theme 'doom-one t))
  (use-package rainbow-delimiters
    :ensure t
    :config
    (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))
  (use-package autopair
    :ensure t
    :config
    (autopair-global-mode))

  (custom-config--base)
  (custom-config--evil)
  ;; delete trailing whitespace on save
  (add-hook 'before-save-hook
	    'delete-trailing-whitespace))


(defun custom-config--base ()
  "Basic configuration, kind of a catch all at this point."

  (use-package flycheck
    :ensure t
    :init (global-flycheck-mode))

  (use-package ivy
    :ensure t
    :config
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t))
  (use-package swiper
    :ensure t
    :after (ivy))
  (use-package counsel
    :ensure t
    :after (ivy))

  (use-package which-key
    :ensure t
    :config
    (which-key-mode))

  (use-package projectile
    :ensure t
    :init
    (setq projectile-completion-system 'ivy)
    (setq projectile-project-search-path '("~/Code"))
    :config
    (use-package projectile-ripgrep :ensure t)
    (projectile-mode)
    (setq projectile-enable-caching t))

  (use-package company
    :ensure t
    :defer t
    :init (global-company-mode)
    :config
    (progn
      ;; Use Company for completion
      (bind-key [remap completion-at-point] #'company-complete company-mode-map)
      (setq
       company-tooltip-align-annotations t
       company-show-numbers t
       company-minimum-prefix-length 0)
      (add-to-list 'company-backends 'company-elisp))
    :diminish company-mode)

  (use-package company-quickhelp          ; Documentation popups for Company
    :ensure t
    :defer t
    :init (add-hook 'global-company-mode-hook #'company-quickhelp-mode))

  (use-package slime-company
    :ensure t
    :defer t
    :init
    (with-eval-after-load 'company
      (add-to-list 'company-backends 'company-slime))))

(defun custom-config--evil ()
  "Load my evil configuration, this provides vim keys."
  (load-custom-config/evil))

;;; config.el ends here
