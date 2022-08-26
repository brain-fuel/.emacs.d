(setq inhibit-startup-message t)

(scroll-bar-mode -1)                     ; Disable visible scroll bar
(tool-bar-mode -1)                       ; Disable the toolbar
(tooltip-mode -1)                        ; Disable tooltips
(set-fringe-mode 10)                     ; Give some "breathing room"
(global-display-line-numbers-mode)       ; Display line numbers everywhere
(global-set-key
 (kbd "<escape>") 'keyboard-escape-quit) ; Make ESC quit prompts

;; First, you need to have installed Monoid font
;; https://github.com/larsenwork/monoid

(set-face-attribute
 'default nil
 :font "Monoid"
 :height 156)

(load-theme 'wombat)

;; Initialize package sources
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
	("org"   . "https://orgmode.org/elpa/")
	("elpa"  . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package command-log-mode)

(use-package ivy
  :bind (; TODO Install Swiper ("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-alt-done)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))


;; ;; ;; CUSTOM SET VARIABLES    ;; ;; ;;
;; ;; ;; ALL THE STUFF BELOW IS  ;; ;; ;;
;; ;; ;; AUTOMATICALLY INSTALLED ;; ;; ;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(ivy command-log-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
