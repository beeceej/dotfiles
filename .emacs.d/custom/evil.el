(defun load-custom-config/evil ()
  (use-package evil
    :ensure t
    :init
    (setq evil-search-module 'evil-search)
    (setq evil-ex-complete-emacs-commands nil)
    (setq evil-vsplit-window-right t)
    (setq evil-split-window-below t)
    (setq evil-shift-round nil)
    (setq evil-want-C-u-scroll t)
	(setq evil-want-keybinding nil)
    :config
    ;; multi cursor support
    (custom-config/evil--evil-mc)
    ;; spacemacs style keymaps
    (custom-config/evil--evil-leader)
    ;; comment code out based on visual mode selection
    (custom-config/evil--evil-commentary)
    ;; quick vim style surrounding
    (custom-config/evil--evil-surround)
    (custom-config/evil--evil-collection)
    (evil-mode)
    (evil-define-key 'normal lisp-mode-map
      (kbd "TAB") 'evil-indent)))

(defun custom-config/evil--evil-mc ()
  (use-package evil-mc
    :ensure t
    :init
    :config (global-evil-mc-mode 1)))

(defun custom-config/evil--evil-surround ()
  (use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1)))

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
      "SPC" 'execute-extended-command
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
      "pt" 'treemacs
      "sgp" 'counsel-git-grep
      "pg" 'projectile-ripgrep
      "sl" 'sort-lines
      "ss" 'swiper
      "tsp" 'treemacs-switch-workspace
      "w-" 'split-window-vertically
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
    (evil-leader/set-key-for-mode 'tide-mode "gg" 'tide-jump-to-definition)
    (evil-leader/set-key-for-mode 'js-mode "gg" 'tide-jump-to-definition)
    (evil-leader/set-key-for-mode 'lisp-mode "ef" 'slime-eval-defun)
    (evil-leader/set-key-for-mode 'lisp-mode "er" 'slime-eval-region)
    (evil-leader/set-key-for-mode 'emacs-lisp-mode "ef" 'eval-defun)
    (evil-leader/set-key-for-mode 'emacs-lisp-mode "er" 'eval-region)
    (evil-leader/set-key-for-mode 'python-mode "eb" 'elpy-shell-send-buffer)
    (evil-leader/set-key-for-mode 'graphviz-dot-mode "cp" 'graphviz-dot-preview)
    (global-evil-leader-mode)))

(defun custom-config/evil--evil-collection ()
  (use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init)))
