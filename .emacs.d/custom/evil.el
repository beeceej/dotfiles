(defun load-custom-config/evil ()
  (use-package evil
    :ensure t
    :init
    (setq evil-search-module 'isearch)
    (setq evil-ex-complete-emacs-commands nil)
    ;; (setq evil-vsplit-window-right t)
    ;; (setq evil-split-window-below t)
    (setq evil-shift-round nil)
    (setq evil-want-C-u-scroll t)
	(setq evil-want-keybinding nil)
    :config
    ;; leader key keymaps
    (custom-config/evil--evil-leader)

    ;; comment code out based on visual mode selection
    (custom-config/evil--evil-commentary)

    (evil-mode)
    (evil-define-key 'normal lisp-mode-map
      (kbd "TAB") 'evil-indent))
  (use-package evil-collection
	:after evil
	:ensure t
	:config
	(evil-collection-init)))

(defun custom-config/evil--evil-commentary ()
  (use-package evil-commentary
    :ensure t
    :config (evil-commentary-mode)))

(defun custom-config/evil--evil-leader ()
  (use-package evil-leader
    :ensure t
    :init
    :config
    (evil-leader/set-leader "SPC")
    (evil-leader/set-key
      "SPC" 'smex
      "TAB" 'mode-line-other-buffer
      "bd" 'kill-buffer
      "be" 'eval-buffer
      "bl" 'electric-buffer-list
      "ff" 'find-file
      "glb" 'magit-log-buffer-file
      "gs" 'magit
      "of" 'ns-open-file-using-panel
      "oi" 'eglot-organize-imports
      "p$t" 'projectile-run-term
      "pf" 'projectile-find-file
      "pp" 'projectile-switch-project
      "sgp" 'counsel-git-grep
      "pg" 'projectile-ripgrep
      "sl" 'sort-lines
      "ss" 'isearch-forward ;; while isearching you can press C-s to iterate through matches
      "w/" 'split-window-horizontally
      "wH" 'evil-window-move-far-left
      "wJ" 'evil-window-move-very-bottom
      "wK" 'evil-window-move-very-top
      "wL" 'evil-window-move-far-right
      "wh" 'windmove-left
      "wj" 'windmove-down
      "wk" 'windmove-up
      "wl" 'windmove-right
      "wsk" 'evil-window-increase-height
      "wsj" 'evil-window-decrease-height
      "wsl" 'evil-window-increase-width
      "wsh" 'evil-window-decrease-width
      "gg" 'xref-find-definitions
      "ww" 'next-multiframe-window)
    (evil-leader/set-key-for-mode 'lisp-mode "ef" 'slime-eval-defun)
    (evil-leader/set-key-for-mode 'lisp-mode "er" 'slime-eval-region)
    (evil-leader/set-key-for-mode 'emacs-lisp-mode "ef" 'eval-defun)
    (evil-leader/set-key-for-mode 'emacs-lisp-mode "er" 'eval-region)
    (evil-leader/set-key-for-mode 'python-mode "eb" 'elpy-shell-send-buffer)
    (global-evil-leader-mode)))
