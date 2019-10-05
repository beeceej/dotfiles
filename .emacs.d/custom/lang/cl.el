(defun load-custom-config/lang/cl ()
  (setup--slime)
  (use-package slime :ensure t))

(defun setup--slime ()
  (load (expand-file-name "~/quicklisp/slime-helper.el"))
  ;; Replace "sbcl" with the path to your implementation
  ;; Set your lisp system and, optionally, some contribs
  (setq slime-contribs '(slime-fancy slime-company))
  (setq inferior-lisp-program "sbcl"))
