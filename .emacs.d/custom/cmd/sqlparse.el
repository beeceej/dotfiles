(defun sqlparse-region (beg end)
  (let ((sql-parse-cmd
	 "python -c 'import sys, sqlparse; print(sqlparse.format(sys.stdin.read(), reindent=True))'"))
    (interactive "r")
    (shell-command-on-region beg end sql-parse-cmd t t)))
