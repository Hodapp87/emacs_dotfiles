(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-process-type (quote stack-ghci))
 '(org-agenda-files (quote ("~/notes.git/log2.org")))
)

;; ----------------------------------------------------------------------
;; Style stuff
;; ----------------------------------------------------------------------
(load-theme 'deeper-blue)
(set-face-attribute 'default nil :height 100)
(tool-bar-mode 0)
(setq-default visual-line-mode t)
(setq-default menu-bar-mode nil)
(setq line-number-mode t)
(setq column-number-mode t)
(setq show-paren-mode t)
(setq inhibit-startup-screen t)

;; ----------------------------------------------------------------------
;; org-mode:
;; ----------------------------------------------------------------------
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; ----------------------------------------------------------------------
;; Haskell:
;; ----------------------------------------------------------------------
(require 'haskell-mode)
(setq haskell-process-log t)
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

;; ----------------------------------------------------------------------
;; Code style:
;; ----------------------------------------------------------------------
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default c-default-style "linux")
(setq python-indent-offset 4)

(server-start)
