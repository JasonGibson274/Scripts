; MELPA
(require 'package)
(add-to-list 'package-archives
       '("melpa-stable" . "https://stable.melpa.org/packages/"))

; tabs
(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

; clean up white spaces on save
(add-hook 'before-save-hook 'whitespace-cleanup)

; editorcondif setup
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'editorconfig)
(editorconfig-mode 1)

; moves backups file out of local directory
(setq backup-directory-alist `(("." . "~/.saves")))

(load-theme 'tango-dark t)

(package-initialize)
(require 'linum-relative)
(require 'linum)
(global-linum-mode t)
;(linum-relative-global-mode t)
(setq column-number-mode t)

; auto-complete
(require 'auto-complete)
(ac-config-default)

; ace jumping
(add-to-list 'load-path "which-folder-ace-jump-mode-file-in/")
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

; ace window
(global-set-key (kbd "M-p") 'ace-window)
(require 'ace-jump-mode)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

; markdown mode
(custom-set-variables
 '(markdown-command "/usr/bin/pandoc"))

; get rid of menu bar
(tool-bar-mode -1)
(menu-bar-mode -1)

; startup screen
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
;(setq dashboard-startup-banner 'logo)
(setq dashboard-items '((recents	. 10)
                        (bookmarks . 0)
                        (projects . 0)
                        (agenda . 0)
                        (registers . 0)))

(require 'ox-latex)
(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))
(add-to-list 'org-latex-classes
       '("article"
         "\\documentclass{article}"
         ("\\section{%s}" . "\\section*{%s}")))
