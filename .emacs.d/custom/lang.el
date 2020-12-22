;;;; lang --- custom language support

;;; Commentary:
;;; sets up modes for various languages

;;; Code:

;; ELISP
(require 'lisp-mode)
;; ----------------------------------------------------------------------------------------

;; COMMON LISP
(use-package slime
  :ensure t
  :config (load (expand-file-name "~/quicklisp/slime-helper.el"))
  ;; Replace "sbcl" with the path to your implementation
  ;; Set your lisp system and, optionally, some contribs
  (setq slime-contribs '(slime-fancy slime-company))
  (setq inferior-lisp-program "sbcl"))
;; ----------------------------------------------------------------------------------------

;; OCAML
(use-package tuareg :ensure t)
(defvar *opam-elisp-path*
  (concat (getenv "HOME") "/Users/brianjones/.opam/default/share/emacs/site-lisp")
  "Path to opam Emacs configuration.")
(defvar *opam-user-setup-path*
  (concat (getenv "HOME") "/.emacs.d/opam-user-setup.el")
  "Path to opam Emacs configuration.")
(when (file-exists-p *opam-user-setup-path*)
  (require 'opam-user-setup  *opam-user-setup-path*))
(when (file-exists-p *opam-elisp-path*)
  (add-to-list 'load-path *opam-elisp-path*))
;; ----------------------------------------------------------------------------------------

;; Markdown

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
	  ("\\.md\\'" . gfm-mode)
	  ("\\.markdown\\'" . gfm-mode))
  :init (setq markdown-command "multimarkdown"))
(use-package vmd-mode
    :ensure t
    :after (markdown-mode))
;; ----------------------------------------------------------------------------------------

;; Javascript/Typescript/Web --------------------------------------------------------------
(use-package typescript-mode :ensure t)
(defvar prettier-enabled-modes
  '(typescript-mode-hook
    vue-mode-hook
    json-mode-hook)
  "modes that prettier should be loaded for")
(use-package prettier-js
  :ensure t
  :config (dolist (hook prettier-enabled-modes)
	    (add-hook hook 'prettier-js-mode)))
;; ----------------------------------------------------------------------------------------


;; TERRAFORM ------------------------------------------------------------------------------
(use-package terraform-mode
  :ensure t
  :config (add-hook 'before-save-hook 'terraform-format-buffer))
;; ----------------------------------------------------------------------------------------

;; LSP
(use-package eglot
  :ensure t
  :config
  (add-to-list 'eglot-server-programs
               '(haskell-mode . ("haskell-language-server-wrapper" "--lsp"))))


;; snippets
(use-package yasnippet :ensure t)

;;; lang.el ends here
