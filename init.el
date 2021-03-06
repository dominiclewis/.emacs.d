;;Pacakge configs
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"   . "https://orgmode.org/elpa/")
                         ("gnu"   . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")))

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

(use-package all-the-icons)

;; projectile
 (use-package projectile
   :ensure t
   :bind ("C-c p" . projectile-command-map)
   :config
   (projectile-global-mode)
   (setq projectile-completion-system 'default))

;Magit - Git
(use-package magit
  :ensure t
  :init
  (progn
  (bind-key "C-x g" 'magit-status)
  ))

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

;; Company - Autocompletion
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 3)
  (global-company-mode t))

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

;;Spell Checking
(use-package flyspell
  :ensure t
  :defer t
  :init
  (progn
    (add-hook 'prog-mode-hook 'flyspell-prog-mode)
    (add-hook 'text-mode-hook 'flyspell-mode)
    ))

;;Swiper / Ivy / Counsel
   (use-package counsel
:ensure t
  :bind
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line)))

  (use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "%d/%d ")
  (setq ivy-display-style 'fancy))

  (use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
	 ("C-r" . swiper)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

;; UI
(menu-bar-mode -1)

;; Line Numbers
(when (version<= "26.0.50" emacs-version)
    (global-display-line-numbers-mode))

;; Visual Line Mode wrapping
;(global-visual-line-mode t) Apparently not needed when line-move-visual is set?

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

;;C++ Indentation
(setq c-default-style "linux"
                c-basic-offset 4)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (doom-themes use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
