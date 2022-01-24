;;;; config.el --- custom emacs configuration

;;; Commentary:
;;; sets up all the fun stuff

;;; Code:

;; use-package setup
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))
(require 'use-package)

;; Programming language configuration

;; custom EVIL mode configuration
(load "~/.emacs.d/custom/evil.el")

;; custom magit configuration
(load "~/.emacs.d/custom/magit.el")


(defun load-custom-config ()
  "Set up custom configuration."
  ;; look and feel
  (condition-case nil
	  (progn
		(set-frame-font "Jetbrains Mono 14"))
	(error nil))
  ;; (global-linum-mode)
  (blink-cursor-mode 0)
  (menu-bar-mode -1)
  (toggle-scroll-bar -1)
  (tool-bar-mode -1)
  (show-paren-mode 1)
  (setq-default tab-width 4)
  (use-package doom-themes
    :ensure t
    :config (load-theme 'doom-one t))


  (custom-config--base)
  (custom-config--evil)
  ;; delete trailing whitespace on save
  (add-hook 'before-save-hook 'delete-trailing-whitespace))


(defun custom-config--base ()
  "Basic configuration, kind of a catch all at this point."
  (setq ido-enable-flex-matching t)
  (ido-mode 1)
  (setq ido-everywhere t)
  (use-package ido-grid-mode
	:ensure t
	:config
	(ido-grid-mode 1))
  (ido-ubiquitous-mode)
  (use-package smex :ensure t :after ido-grid-mode)
  (use-package which-key
    :ensure t
    :config
    (which-key-mode))

  (use-package projectile
    :ensure t
    :init
    (setq projectile-completion-system 'ido)
    (setq projectile-project-search-path '("~/Code"))
	(setq projectile-indexing-method 'alien)
    :config
    (projectile-mode))

  (use-package projectile-ripgrep
	:ensure t
	:after (projectile)))


(defun custom-config--evil ()
  "Load my evil configuration, this provides vim keys."
  (load-custom-config/evil))

(defun python-to-json ($string &optional $from $to)
  "Remove the following letters: {a e i o u}.

When called interactively, work on current paragraph or text selection.

When called in lisp code, if $string is non-nil, returns a changed string.
If $string nil, change the text in the region between positions $from $to."
  (interactive
   (if (use-region-p)
       (list nil (region-beginning) (region-end))
     (let ((bds (bounds-of-thing-at-point 'paragraph)) )
       (list nil (car bds) (cdr bds)) ) ) )

  (let (workOnStringP inputStr outputStr)
    (setq workOnStringP (if $string t nil))
    (setq inputStr (if workOnStringP $string (buffer-substring-no-properties $from $to)))
    (setq outputStr
          (let ((case-fold-search t))
            (replace-regexp-in-string " false" " false" inputStr)))
    (setq outputStr
          (let ((case-fold-search t))
            (replace-regexp-in-string "\\[false\\]" "\[false\]" outputStr)))
    (setq outputStr
          (let ((case-fold-search t))
            (replace-regexp-in-string " true" " true" outputStr)))
    (setq outputStr
          (let ((case-fold-search t))
            (replace-regexp-in-string "\\[true\\]" "\[true\]" outputStr)))
    (setq outputStr
          (let ((case-fold-search t))
            (replace-regexp-in-string " None" " null" outputStr)))
    (setq outputStr
          (let ((case-fold-search t))
            (replace-regexp-in-string "None" "null" outputStr)))
    (setq outputStr
          (let ((case-fold-search t))
            (replace-regexp-in-string "'" "\"" outputStr)))

    (if workOnStringP
        outputStr
      (save-excursion
        (delete-region $from $to)
        (goto-char $from)
        (insert outputStr)))))

;;; config.el ends here
