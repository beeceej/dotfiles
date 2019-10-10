(defun load-custom-config/lang/vue ()
  (use-package vue-mode
    :ensure t
    :config
    ;; 0, 1, or 2, representing (respectively) none, low, and high coloring
    (setq mmm-submode-decoration-level 0)))
