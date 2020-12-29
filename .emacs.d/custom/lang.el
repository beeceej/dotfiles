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
  :config (add-hook 'terraform-mode-hook 'terraform-format-buffer))
;; ----------------------------------------------------------------------------------------

;; eglot-organize-imports is hopefully a temporary stopgap until
;; https://github.com/joaotavora/eglot/issues/574 is addressed.
(defun eglot-organize-imports ()
  "Offer to execute the source.organizeImports code action."
  (interactive)
  (unless (eglot--server-capable :codeActionProvider)
	(eglot--error "Server can't execute code actions!"))
  (let* ((server (eglot--current-server-or-lose))
		 (actions (jsonrpc-request
				   server
				   :textDocument/codeAction
				   (list :textDocument (eglot--TextDocumentIdentifier))))
		 (action (cl-find-if
				  (jsonrpc-lambda (&key kind &allow-other-keys)
					(string-equal kind "source.organizeImports" ))
				  actions)))
	(when action
	  (eglot--dcase action
		(((Command) command arguments)
		 (eglot-execute-command server (intern command) arguments))
		(((CodeAction) edit command)
		 (when edit (eglot--apply-workspace-edit edit))
		 (when command
		   (eglot--dbind ((Command) command arguments) command
			 (eglot-execute-command server (intern command) arguments))))))))

;; LSP
(use-package eglot  :ensure t)


(use-package go-mode
  :ensure t
  :after eglot
  :config
  (add-hook 'go-mode-hook #'eglot-ensure))

;; snippets
(use-package yasnippet :ensure t)

;;; lang.el ends here
