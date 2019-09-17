(load "~/.emacs.d/custom/evil.el")
(load "~/.emacs.d/custom/lang/elisp.el")
(load "~/.emacs.d/custom/lang/go.el")

(defun load-custom-config ()
  "Set up use package.
this should be the very first thing done
most everything else depends on it from here on out."
  (custom-config--use-package)
  (custom-config--theme)
  (custom-config--font)
  (custom-config--base)
  (custom-config--evil)
  (custom-config--lang))

(defun custom-config--use-package ()
  "Set up use-package, which is what we'll use to install most dependencies from here on out."

  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))
  (require 'use-package))

(defun custom-config--theme ()
  "Set up my custom Emacs theme."

  (use-package doom-themes
    :ensure t
    :config
    (load-theme 'doom-one t)))

(defun custom-config--font ()
  "Set up my preferred font."

  (set-frame-font "Inconsolata 16"))

(defun custom-config--base ()
  "Basic configuration, kind of a catch all at this point."

  (global-linum-mode)
  (blink-cursor-mode 0)
  (global-hl-line-mode)
  (menu-bar-mode -1)
  (toggle-scroll-bar -1)
  (tool-bar-mode -1)

  (use-package autopair
    :ensure t
    :config
    (autopair-global-mode))

  (use-package flycheck
    :ensure t
    :init (global-flycheck-mode))

  (use-package ivy
    :ensure t
    :config
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t))

  (use-package which-key
    :ensure t
    :config
    (which-key-mode))

  (use-package magit
    :ensure t
    :config
    (use-package evil-magit
      :ensure t)
    (defun setup-commit ()
      (let* ((curr-branch (magit-get-current-branch))
	     (ticket-parts (split-string (nth 1 (split-string curr-branch "/")) "-"))
	     (project-name (nth 0 ticket-parts))
	     (ticket-num (nth 1 ticket-parts)))
	(insert (concat "[" project-name "-" ticket-num "]"))))
    (add-hook 'git-commit-setup-hook 'setup-commit))

  (use-package swiper :ensure t)

  (use-package projectile
    :ensure t
    :init
    (setq projectile-completion-system 'ivy)
    :config
    (projectile-mode)
    (setq projectile-enable-caching t))

  (use-package treemacs
    :ensure t
    :config
    (use-package treemacs-evil
      :ensure t)
    (use-package treemacs-projectile
      :ensure t))

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
       company-show-numbers t))
    :diminish company-mode)

  (use-package company-quickhelp          ; Documentation popups for Company
   :ensure t
   :defer t
   :init (add-hook 'global-company-mode-hook #'company-quickhelp-mode))

  (use-package company-go
    :ensure t
    :defer t
    :init
    (with-eval-after-load 'company
      (add-to-list 'company-backends 'company-go)
      (add-to-list 'company-backends 'company-elisp))))

(defun custom-config--evil ()
  "load my evil configuration, this provides vim keys"
  (load-custom-config/evil))

(defun custom-config--lang ()
  "Load programming specific configuration"
  (load-custom-config/lang/elisp)
  (load-custom-config/lang/go))

