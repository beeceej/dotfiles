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
    :config
    ;; multi cursor support
    (custom-config/evil--evil-mc)
    ;; spacemacs style keymaps
    (custom-config/evil--evil-leader)
    ;; comment code out based on visual mode selection
    (custom-config/evil--evil-commentary)
    ;; quick vim style surrounding
    (custom-config/evil--evil-surround)
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
      "gs" 'magit
      "ff" 'find-file
      "ss" 'swiper
      "ww" 'next-multiframe-window
      "w-" 'split-window-vertically
      "w/" 'split-window-horizontally
      "wk" 'windmove-up
      "wl" 'windmove-right
      "wh" 'windmove-left
      "wj" 'windmove-down
      "wK" 'evil-window-move-very-top
      "wL" 'evil-window-move-far-right
      "wH" 'evil-window-move-far-left
      "wJ" 'evil-window-move-very-bottom
      "pp" 'projectile-switch-project
      "pt" 'treemacs
      "pf" 'projectile-find-file
      "p$t" 'projectile-run-term
      "TAB" 'mode-line-other-buffer
      "sgp" 'counsel-git-grep
      "be" 'eval-buffer
      "bd" 'kill-buffer)
    (evil-leader/set-key-for-mode 'go-mode "gg" 'godef-jump)
    (evil-leader/set-key-for-mode 'lisp-mode "ef" 'slime-eval-defun)
    (evil-leader/set-key-for-mode 'lisp-mode "er" 'slime-eval-region)
    (evil-leader/set-key-for-mode 'emacs-lisp-mode "ef" 'eval-defun)
    (evil-leader/set-key-for-mode 'emacs-lisp-mode "er" 'eval-region)
    (evil-leader/set-key-for-mode 'graphviz-dot-mode "cp" 'graphviz-dot-preview)
    (global-evil-leader-mode)))
