;;Line Numbers
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

;; Org Mode Setup
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)

