; MELPA
(require 'package)
(add-to-list 'package-archives
  '("melpa-stable" . "https://stable.melpa.org/packages/"))

(set-face-attribute 'default nil :height 150)

;remap caps lock
(global-set-key "∇" 'Control-X-prefix)

; tabs
(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

; clean up white s3760paces on save
(add-hook 'before-save-hook 'whitespace-cleanup)

; editorcondif setup
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'editorconfig)
(editorconfig-mode 1)

; moves backups file out of local directory
(setq backup-directory-alist `(("." . "~/.saves")))

(load-theme 'tango-dark t)

(package-initialize)
(require 'linum)
(global-linum-mode t)
(setq column-number-mode t)

; auto-complete
(require 'auto-complete)
(ac-config-default)

; ace jumping
(require 'ace-jump-mode)
(add-to-list 'load-path "which-folder-ace-jump-mode-file-in/")
(define-key global-map (kbd "C-x r") 'ace-jump-mode)

; ace window
(require 'ace-window)
(global-set-key (kbd "M-p") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

; get rid of menu bar
(tool-bar-mode -1)
(menu-bar-mode -1)

; startup screen
(require 'dashboard)
(require 'projectile)
(dashboard-setup-startup-hook)
(setq dashboard-banner-logo-title "I started my life with a single absolute: that the world was mine to shape in the image of my highest values and never to be given up to a lesser standard, no matter how long or hard the struggle.")
(setq dashboard-startup-banner "/home/jason/.emacs.d/AtlasShrugged.png")
(setq dashboard-items '((recents  . 20)
                        (bookmarks . 0)
                        (projects . 0)
                        (agenda . 0)
                        (registers . 0)))

;(require 'ox-latex)
;(unless (boundp 'org-latex-classes)
;  (setq org-latex-classes nil))
;(add-to-list 'org-latex-classes
;       '("article"
;         "\\documentclass{article}"
;         ("\\section{%s}" . "\\section*{%s}")))

; function args
;(add-to-list 'load-path "~/.emacs.d/function-args")
;(require 'function-args)
;(fa-config-default)
; case insnsitive searching
;(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

; git diff
(require 'git-gutter)
(global-git-gutter-mode +1)
(git-gutter:linum-setup)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(git-gutter:added-sign "++")
 '(git-gutter:deleted-sign "--")
 '(git-gutter:modified-sign "  ")
 '(git-gutter:update-interval 2)
  '(package-selected-packages
     (quote
       (projectile git-gutter editorconfig dashboard auto-complete ace-window ace-jump-mode))))

(set-face-background 'git-gutter:modified "purple") ;; background color
(set-face-foreground 'git-gutter:added "green")
(set-face-foreground 'git-gutter:deleted "red")



; show matching parens
(show-paren-mode 1)

; always create closing pair
(electric-pair-mode 1)

; markdown
;(use-package markdown-mode
;  :ensure t
;  :commands (markdown-mode gfm-mode)
;  :mode (("README\\.md\\'" . gfm-mode)
;         ("\\.md\\'" . markdown-mode)
;         ("\\.markdown\\'" . markdown-mode))
;  :init (setq markdown-command "multimarkdown"))

; evil mode
;(require 'evil)
;(evil-mode 1)

                                        ; ctags

;syntax checking
;(require 'modern-cpp-font-lock)
;(modern-c++-font-lock-global-mode t)

;flycheck
;(add-hook 'after-init-hook #'global-flycheck-mode)
;(setq-default flycheck-disabled-checkers '(c/c++-clang))

;
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
