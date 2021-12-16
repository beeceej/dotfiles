;;;; magit --- custom configuration

;;; Commentary:
;;; sets up custom magit configuration and extensions

;;; Code:

(use-package magit
  :ensure t
  :config
  (defun jira-setup-commit ()
    "Setup commit text if on a branch pointing to a jira ticket."
    (let* ((curr-branch (magit-get-current-branch))
	   (ticket-parts (split-string (nth 1 (split-string curr-branch "/")) "-"))
	   (project-name (nth 0 ticket-parts))
	   (ticket-num (nth 1 ticket-parts)))
      (insert (concat "feat(" project-name "-" ticket-num "):"))))
  (add-hook 'git-commit-setup-hook 'jira-setup-commit))


(provide 'magit)
;;; magit.el ends here
