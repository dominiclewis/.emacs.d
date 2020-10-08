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

;;C++ Indentation
(setq c-default-style "linux"
                c-basic-offset 4)

