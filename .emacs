(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
(with-eval-after-load "company"
  (define-key company-active-map (kbd "C-p") #'company-select-previous-or-abort)
  (define-key company-active-map (kbd "C-n") #'company-select-next-or-abort))
(defadvice load-theme (before clear-previous-themes activate)
  "Clear existing theme settings instead of layering them"
  (mapc #'disable-theme custom-enabled-themes))
(xterm-mouse-mode)
(setq mouse-wheel-progressive-speed nil)
(setq focus-follows-mouse "auto-raise")
(setq mouse-autoselect-window 't)
(setq-default tab-width 4)
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)
(global-linum-mode t)
(column-number-mode t)
(pixel-scroll-mode)
(setq ring-bell-function 'ignore)
(setq-default truncate-lines t)
(elpy-enable)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'monokai t)
(setq tab-width 4)
(setq c-basic-offset 4)
(setq indent-tabs-mode nil)
(setq-default left-margin-width 1 right-margin-width 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(tool-bar-mode nil)
 '(scroll-bar-mode nil)
 '(fringe-mode no-fringe)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
	(## elpy company-c-headers company-anaconda company minimap ibuffer-sidebar dired-sidebar vscode-icon use-package)))
 '(vhdl-electric-mode t)
 '(vhdl-stutter-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrains Mono" :foundry "JB  " :slant normal :weight normal :height 113 :width normal)))))

(use-package dired-sidebar
  :bind (("C-x C-n" . sidebar-toggle))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :init
  (add-hook 'dired-sidebar-mode-hook
            (lambda ()
              (unless (file-remote-p default-directory)
                (auto-revert-mode))))
  :config
  (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
  (push 'rotate-windows dired-sidebar-toggle-hidden-commands)

  (setq dired-sidebar-one-instance-p t)
  (setq dired-sidebar-no-delete-other-windows t)
  (setq dired-sidebar-subtree-line-prefix "__")
  (setq dired-sidebar-theme 'vscode)
  (setq dired-sidebar-use-term-integration t)
  (setq dired-sidebar-use-custom-font t)
  (setq dired-sidebar-width 20))

(defun sidebar-toggle ()
  "Toggle both `dired-sidebar' and `ibuffer-sidebar'."
  (interactive)
  (dired-sidebar-toggle-sidebar)
  (ibuffer-sidebar-toggle-sidebar))

(use-package minimap
  :ensure t
  :config
  (setq minimap-width-fraction 0.08)
  (setq minimap-minimum-width 10)
  (setq minimap-window-location 'right))

