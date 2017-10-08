(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
		    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line
;;(load "eclim")

(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))

;; Write backups to ~/.emacs.d/backup/
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying      t  ; Don't de-link hard links
      version-control        t  ; Use version numbers on backups
      delete-old-versions    t  ; Automatically delete excess backups:
      kept-new-versions      2 ; how many of the newest versions to keep
      kept-old-versions      2) ; and how many of the old

;; Keybinds
(global-set-key (kbd "M-i") 'previous-line)
(global-set-key (kbd "M-j") 'backward-char)
(global-set-key (kbd "M-k") 'next-line)
(global-set-key (kbd "M-l") 'forward-char)
(global-set-key (kbd "M-u") 'move-beginning-of-line)
(global-set-key (kbd "M-o") 'move-end-of-line)

;;move by word
(global-set-key (kbd "M-C-l") 'forward-word)
(global-set-key (kbd "M-C-j") 'backward-word)
;;must unbind for C-M-i
(global-unset-key (kbd "M-C-i"))
(define-key minibuffer-local-map (kbd "M-C-0") 'completion-at-point) ;;doesn't work
(global-set-key (kbd "M-C-i") 'previous-line)
(global-set-key (kbd "M-C-k") 'next-line)
(global-set-key (kbd "M-C-u") 'move-beginning-of-line)
(global-set-key (kbd "M-C-o") 'move-end-of-line)

;; set up cuda-gdb with GUD
(setq gud-gdb-command-name "cuda-gdb --annotate=3")

;; additional setup to run cuda-gdb within emacs
;;(setq to-install
;;      '(exec-path-from-shell))
;;(exec-path-from-shell-initialize)
;;(exec-path-from-shell-copy-env "PATH")
;;(exec-path-from-shell-copy-env "LD_LIBRARY_PATH")
