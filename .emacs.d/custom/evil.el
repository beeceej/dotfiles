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
    (evil-mode)))

(defun custom-config/evil--evil-mc ()
  (use-package evil-mc
    :ensure t
    :init
    :config (global-evil-mc-mode 1)))

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
      "TAB" 'mode-line-other-buffer
      "be" 'eval-buffer
      "bd" 'kill-buffer)
    (evil-leader/set-key-for-mode 'go-mode "gg" 'godef-jump)
    (global-evil-leader-mode)))
