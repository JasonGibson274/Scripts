;configure server
(server-start)

;MELPA
(require 'package)
(add-to-list 'package-archives
  '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

; EDITOR
(load-theme 'tango-dark t)
; set text height, for high dpi displays
(set-face-attribute 'default nil :height 100)

; get rid of menu bar
(tool-bar-mode -1)
(menu-bar-mode -1)

; moves backups file out of local director
(setq backup-directory-alist `(("." . "~/.saves")))

; tabs
(setq-default tab-width 2)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cuh\\'" . c++-mode))

; clean up white spaces on save
(add-hook 'before-save-hook 'whitespace-cleanup)

; show parans that match
(show-paren-mode 1)
; make matching pair
(electric-pair-mode 1)

; PACKAGES

; evil mode
(require 'evil)
(evil-mode 1)

; init linum for line numberings
(require 'linum)
(global-linum-mode t)
(setq column-number-mode t)

; editorcondif setup
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'editorconfig)
(editorconfig-mode 1)

; auto-complete
; https://github.com/auto-complete/auto-complete/blob/master/doc/manual.md
(require 'auto-complete)
(ac-config-default)

; ace window
(require 'ace-window)
(global-set-key (kbd "M-p") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

; ace jumping
(require 'ace-jump-mode)
(define-key evil-normal-state-map (kbd "m") 'ace-jump-mode)
(define-key evil-normal-state-map (kbd "M") 'ace-jump-line-mode)

; startup screen
(require 'dashboard)
(require 'projectile)
(dashboard-setup-startup-hook)
(setq dashboard-banner-logo-title
"Contradictions do not exist. Whenever you think that you are facing a contradiction, check your premises. You will find that one of them is wrong.")
(setq dashboard-startup-banner "/home/jason/.emacs.d/AtlasShrugged.png")
(setq dashboard-items '((recents  . 20)
                        (bookmarks . 10)
                        (projects . 10)
                        (agenda . 0)
                        (registers . 0)))

(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

; function args
;(require 'function-args)
;(fa-config-default)
; case insnsitive searching
;(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

; git diff
;(require 'git-gutter)
;(global-git-gutter-mode +1)
;(git-gutter:linum-setup)
;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
; '(git-gutter:added-sign "++")
; '(git-gutter:deleted-sign "--")
; '(git-gutter:modified-sign "  ")
; '(git-gutter:update-interval 2)
;  '(package-selected-packages
;     (quote
;       (projectile git-gutter editorconfig dashboard auto-complete ace-window ace-jump-mode))))

;(set-face-background 'git-gutter:modified "purple") ;; background color
;(set-face-foreground 'git-gutter:added "green")
;(set-face-foreground 'git-gutter:deleted "red")

;(require 'flycheck)
(global-flycheck-mode)
(setq flycheck-check-syntax-automatically '(mode-enabled save))
;(setq flycheck-highlighting-mode '(columns))
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)
(add-hook 'c++-mode-hook
          (lambda () (setq flycheck-clang-include-path
                           (list (expand-file-name "/opt/ros/melodic/include:catkin_ws/rj/src")))))
