; tabs
(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

; move windows using shift arrow
(windmove-default-keybindings)

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
(global-linum-mode t)
;(linum-relative-global-mode t)
(setq column-number-mode t)

; MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))

; auto-complete
(ac-config-default)

; ace jumping
(add-to-list 'load-path "which-folder-ace-jump-mode-file-in/")
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

; ace window
(global-set-key (kbd "M-p") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
