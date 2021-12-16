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

;;; lang.el ends here
