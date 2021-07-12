;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Basic setup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Prevent Startup Screen
(setq inhibit-startup-screen t)
;; Global Line numbers
(global-linum-mode 't)
;; Disable title and tool bar
(tool-bar-mode -1)
(menu-bar-mode -1)
;; Remove scroll bar
(scroll-bar-mode -1)
;; Set font
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrains Mono" :foundry "JB" :slant normal :weight normal :height 120 :width normal)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Use Package (ELPA, MELPA)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(elpy magit helpful which-key ivy-rich ivy all-the-icons use-package doom-themes))
 '(python-shell-interpreter "python3")
 '(vhdl-electric-mode t)
 '(vhdl-file-header
   "-------------------------------------------------------------------------------
-- Title      : <title string>
-- Project    : <project>
-------------------------------------------------------------------------------
-- File       : <filename>
-- Author     : Steve Robichaud
-- Company    : Self
-- Created    : <date>
-- Last update: <date>
-- Platform   : <platform>
-- Standard   : <standard>
<projectdesc>-------------------------------------------------------------------------------
-- Description: <cursor>
<copyright>-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- <date>  1.0      <login>	Created
-------------------------------------------------------------------------------

")
 '(vhdl-standard '(8 nil))
 '(vhdl-stutter-mode t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ivy
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(ivy-mode 1)
(ivy-rich-mode 1)
(require 'which-key)
(which-key-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Theme
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-monokai") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package all-the-icons)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ELPY
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package elpy
  :ensure t
  :init
  (elpy-enable))
(setq elpy-rpc-python-command "python3")
(add-to-list 'process-coding-system-alist '("python" .(utf-8 , utf-8)))
