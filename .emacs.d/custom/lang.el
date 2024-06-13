;;;; lang --- custom language support

;;; Commentary:
;;; sets up modes for various languages

;;; Code:

;; ELISP
(require 'lisp-mode)
;; ----------------------------------------------------------------------------------------

;; COMMON LISP
;(use-package slime
;  :ensure t
;  :config (load (expand-file-name "~/quicklisp/slime-helper.el"))
;  ;; Replace "sbcl" with the path to your implementation
;  ;; Set your lisp system and, optionally, some contribs
;  (setq slime-contribs '(slime-fancy slime-company))
;  (setq inferior-lisp-program "sbcl"))
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

(use-package rjsx-mode
  :ensure t
  :mode ("\\.js\\'"
         "\\.jsx\\'")
  :config
  (setq js2-mode-show-parse-errors nil
        js2-mode-show-strict-warnings nil
        js2-basic-offset 2
        js-indent-level 2)
  (setq-local flycheck-disabled-checkers (cl-union flycheck-disabled-checkers
												   ; jshint doesn't work for JSX
                                                   '(javascript-jshint))))
(use-package add-node-modules-path
  :ensure t
  :defer t
  :hook (((js2-mode rjsx-mode) . add-node-modules-path)))

(use-package typescript-mode :ensure t)
(defvar prettier-enabled-modes
  '(typescript-mode-hook
    vue-mode-hook
    json-mode-hook
	rjsx-mode-hook)
  "modes that prettier should be loaded for")
(use-package prettier-js
  :ensure t
  :config (dolist (hook prettier-enabled-modes)
			(add-hook hook 'prettier-js-mode)))

;; ----------------------------------------------------------------------------------------


;; TERRAFORM ------------------------------------------------------------------------------
(use-package terraform-mode
  :ensure t
  :config (add-hook 'terraform-mode-hook 'terraform-format-buffer))
;; ----------------------------------------------------------------------------------------


(use-package pyvenv :ensure t)


(use-package go-mode
  :ensure t
  :config)

(require 'eglot)
(add-hook 'go-mode-hook #'eglot-ensure)

(defun my-eglot-organize-imports () (interactive)
	   (eglot-code-actions nil nil "source.organizeImports" t))

  ;; Set up before-save hooks to format buffer and add/delete imports.
  ;; Make sure you don't have other gofmt/goimports hooks enabled.
  (defun lsp-go-install-save-hooks ()
	(add-hook 'before-save-hook #'eglot-format-buffer t t)
	(add-hook 'before-save-hook #'my-eglot-organize-imports t t))
  (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)


;; snippets
(use-package yasnippet :ensure t)

;;; lang.el ends here
