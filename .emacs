
(package-initialize)

(setq inhibit-startup-screen t) ; deactivate splash screen at startup

;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/") t))

;; show parenthesis matching
(show-paren-mode 1)

;; autocomplete paired brackets
(electric-pair-mode 1)

;; ignore certain file extensions in dired
(require 'dired-x)
(setq-default dired-omit-files-p t) ; this is buffer-local variable
(setq dired-omit-files
    (concat dired-omit-files "\\|^\\..+$\\|\\.log$\\|\\.aux$\\|\\.rip$\\|\\.prv$\\"))
(setq dired-omit-files (concat dired-omit-files "\\|^\\..+$"))

;; Magit keybinding
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; helm (for smarter autocompletion)
(require 'helm-config)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)

;;; Polymode
;;; MARKDOWN
(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))

;;; R modes
(add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))

;; AUCTeX configuration
(setq font-latex-fontify-script nil) ;; Turn off fontification of underscores
(add-hook 'latex-mode-hook 'turn-on-reftex) ;; RefTeX initialize
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-auctex t)

;; for binding key to ace window
(global-set-key (kbd "M-o") 'ace-window)

;; ESS customization
(require 'ess-site)
(setq ess-default-style 'DEFAULT)
(setq ess-S-assign-key (kbd "C-="))
(ess-toggle-S-assign-key t) ; enable above key definition
(ess-toggle-underscore nil) ; leave my underscore key alone!

;; Set pipe operator
(defun then_R_operator ()
  "R - %>% operator or 'then' pipe operator"
  (interactive)
  (just-one-space 1)
  (insert "%>%")
  (just-one-space 1))
;;  (reindent-then-newline-and-indent))
(define-key ess-mode-map (kbd "C->") 'then_R_operator)
(define-key inferior-ess-mode-map (kbd "C->") 'then_R_operator)

;; set default font
(set-frame-font "Inconsolata 12" nil t)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes (quote (adwaita)))
 '(package-selected-packages
   (quote
    (company-reftex w3 ssh polymode magit helm-ebdb ess company auto-complete auctex ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
