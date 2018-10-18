;;Pacakge configs
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"   . "http://orgmode.org/elpa/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")))

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

;; projectile
 (use-package projectile
   :ensure t
   :bind ("C-c p" . projectile-command-map)
   :config
   (projectile-global-mode)
   (setq projectile-completion-system 'default))

;; Company - Autocompletion
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 3)
  (global-company-mode t))

;;Try - Test out packages
(use-package try
	:ensure t)

;;Which Key - Keybinding
(use-package which-key
        :ensure t
	:config
	(which-key-mode))

;;Org Bullets - Pretty Bullets
;(use-package org-bullets
;        :ensure t
;        :config
;        (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
;; UI
(menu-bar-mode   -1)

;; Line Numbers
(when (version<= "26.0.50" emacs-version )
    (global-display-line-numbers-mode))

;;Column Mode
(setq column-number-mode t)

;; Org Mode Setup
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)


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
