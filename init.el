(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-process-type (quote stack-ghci))
 '(save-interprogram-paste-before-kill t)
 '(package-selected-packages
   (quote
    (unicode-fonts f dash-functional rust-mode weechat w3m vlf scala-mode2 paredit nix-mode markdown-mode lua-mode intero geiser ess ensime cider))))

(setq org-agenda-files
      '("~/notes.git/log2.org"
        "~/notes.git/Orgzly/tasks.org"
        "~/notes.git/Orgzly/orgzly-notes.org"))

;; ----------------------------------------------------------------------
;; Local elisp files
;; ----------------------------------------------------------------------
;; From http://www.emacswiki.org/emacs/download/newpaste.el:
(load "~/.emacs.d/newpaste.el")
(load "~/.emacs.d/org-invoice.el")

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
(show-paren-mode 1)
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
; (require 'haskell-mode)
; (setq haskell-process-log t)
; (add-hook 'haskell-mode-hook 'haskell-indentation-mode)
; (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
; (add-hook 'haskell-mode-hook 'intero-mode)

(defun stack-compile ()
  "Run 'stack build' in a compilation buffer."
  (interactive)
  (compile "stack build"))

(defun stack-exec (target)
  "Run 'stack build' and then 'stack exec' on the specified
target, in a compilation buffer."
  (interactive "M'stack exec' target: ")
  (compile (format "stack build && stack exec %s" target)))

;; ----------------------------------------------------------------------
;; Nix:
;; ----------------------------------------------------------------------
; (require 'nix-mode)

;; ----------------------------------------------------------------------
;; R (and related):
;; ----------------------------------------------------------------------
; (require 'ess-site)

;; ----------------------------------------------------------------------
;; Markdown:
;; ----------------------------------------------------------------------
; (require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; ----------------------------------------------------------------------
;; Guile:
;; ----------------------------------------------------------------------
(defun guile-geiser ()
  "Run Geiser using Guile."
  (interactive)
  (run-geiser 'guile))

;; ----------------------------------------------------------------------
;; Code style:
;; ----------------------------------------------------------------------
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default c-default-style "linux")
(setq python-indent-offset 4)

;; ----------------------------------------------------------------------
;; WeeChat client:
;; ----------------------------------------------------------------------
;; (require 'weechat)
;; (require 'weechat-notifications)
;; (require 'notifications)
;; (require 'gnutls)
;; (setq weechat-notification-mode t)
;; (add-to-list 'gnutls-trustfiles (expand-file-name "~/.emacs.d/relay.pem"))

;; ----------------------------------------------------------------------
;; Scala
;; ----------------------------------------------------------------------
; (require 'sbt-mode)
; (require 'ensime)
; (require 'ensime-mode)
(add-hook 'scala-mode-hook 'ensime-mode)
(setq ensime-startup-snapshot-notification 'nil)

;; Whoever turned this on needs to go die in a fire.
;; (delete 'company-dabbrev company-backends)

;; ----------------------------------------------------------------------
;; Lua
;; ----------------------------------------------------------------------
; (require 'lua-mode)

;; ----------------------------------------------------------------------
;; Clojure
;; ----------------------------------------------------------------------
; (require 'clojure-mode)

(require 'paredit)

;; ----------------------------------------------------------------------
;; Rust:
;; ----------------------------------------------------------------------
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

;; ----------------------------------------------------------------------
;; Misc. elisp
;; ----------------------------------------------------------------------
;; Courtesy of https://www.emacswiki.org/emacs/MiniBuffer#minibuffer
(defun switch-to-minibuffer ()
  "Switch to minibuffer window."
  (interactive)
  (if (active-minibuffer-window)
      (select-window (active-minibuffer-window))
    (error "Minibuffer is not active")))

(global-set-key "\C-co" 'switch-to-minibuffer)

;; Offer VLF on large files:
(require 'vlf-setup)

;; Start server only if one's not already running:
(require 'server)
(or (server-running-p)
    (server-start))

;; ----------------------------------------------------------------------
;; Julia
;; ----------------------------------------------------------------------

(defun assq-delete-all-equal (key pairs)
  (let ((result ()))
	(while (not (null pairs))
	  (if (not (equal key (caar pairs)))
	      (setq result (cons (car pairs) result)))
	  (setq pairs (cdr pairs)) )
	(reverse result)))
; (setq auto-mode-alist (assq-delete-all-equal "\\.jl\\'" auto-mode-alist))

;(require 'julia-mode)
;; (add-to-list 'load-path "/home/hodapp/source/julia-shell-mode")
;(require 'julia-shell)
;(defun my-julia-mode-hooks ()
;  (require 'julia-shell))
;(add-hook 'julia-mode-hook 'my-julia-mode-hooks)
;(define-key julia-mode-map (kbd "C-c C-c") 'julia-shell-run-region-or-line)
;(define-key julia-mode-map (kbd "C-c C-s") 'julia-shell-save-and-go)

;; ----------------------------------------------------------------------
;; C/C++
;; ----------------------------------------------------------------------
(add-hook 'c++-mode-hook 'company-mode)
(add-hook 'c-mode-hook 'company-mode)
(add-hook 'c-mode-common-hook 'company-mode)
