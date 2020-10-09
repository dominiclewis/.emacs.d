;;Pacakge configs
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"   . "https://orgmode.org/elpa/")
                         ("gnu"   . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Theme
(use-package doom-themes
  :ensure t
  :init
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
	doom-themes-enable-italic t) ; if nil, italics is universally disable
  :config
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config)
  )

;; Evil
;(use-package evil
;  :ensure t
;  :config
;  (evil-mode t))

; Git Gutter
 (use-package git-gutter
  :ensure t
  :init
  (global-git-gutter-mode +1))

;; NeoTree
(use-package neotree
  :ensure t
  :config
  (global-set-key [f8] 'neotree-toggle)
  )

;;Emacs Dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner 'official))

;;indent-guide
(use-package indent-guide
  :ensure t
  :config
  (indent-guide-global-mode))

;;Beacon
(use-package beacon
  :ensure t
  :config
  (beacon-mode t))

;;Try - Test out packages
(use-package try
  :ensure t)

;;Which Key - Keybinding
(use-package which-key
        :ensure t
	:config
	(which-key-mode))

;; UI
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

;; Line Numbers
(when (version<= "26.0.50" emacs-version)
    (global-display-line-numbers-mode))


;; Visual Line Mode line navigation
(setq line-move-visual nil
      track-eol t) ;Track EOL means <ctrl+n/p> behavior consistent,

;;Column Mode
(setq column-number-mode t)

;; Org Mode Setup
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)

;; Org Indent Mode
(add-hook 'org-mode-hook 'org-indent-mode)

;; Org Agenda
;; The pipe below means task following it are considered by org as "complete".
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "BLOCKED" "|" "DONE" "CANCELED")))

;;C++ Indentation
(setq c-default-style "linux"
      c-basic-offset 4)

;; Markdown
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "/usr/local/bin/pandoc"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(markdown-mode evil which-key try beacon indent-guide dashboard neotree git-gutter doom-themes use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
