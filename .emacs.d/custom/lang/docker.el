(defun load-custom-config/lang/docker ()
  (use-package docker :ensure t)

  (defun docker-rm-dangling ()
    """removes dangling docker images"""
    (interactive)
    (let ((cmd "docker images -f \"dangling=true\" -q | xargs docker rmi -f"))
      (shell-command cmd)))

  (defun docker-stop-all ()
    """stop all running docker containers"""
    (interactive)
    (let ((cmd "docker stop $(docker ps -qa)"))
      (shell-command cmd)))

  (defun docker-rm-all ()
    """rm all stopped docker containers"""
    (interactive "r")
    (let ((cmd "docker rm $(docker ps -qa)"))
      (shell-command cmd))))
