
(package-initialize)

;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango)))
 '(package-selected-packages
   (quote
    (hippie-exp-ext mediawiki imenu-anywhere imenus magit ace-window auto-complete ssh helm package+ ess)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#eeeeec" :foreground "#2e3436" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "nil" :family "Inconsolata")))))


;; Disable fontification of subscripts
(setq font-latex-fontify-script nil)

(setq inhibit-startup-screen t) ; deactivate splash screen at startup


;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/auto-complete/dict")
(auto-complete-mode)
(ac-config-default)


;; polymode, for editing Rcpp and markdown
(add-to-list 'auto-mode-alist '("\\.md$" . poly-markdown-mode))
(add-to-list 'auto-mode-alist '("\\.cppR$" . poly-c++r-mode))

(provide 'polymode-configuration)


;; C++ identation
(setq c-default-style "linux"
      c-basic-offset 2)

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

;; show parenthesis matching
(show-paren-mode 1)

;; autocomplete paired brackets
(electric-pair-mode 1)

;; for binding key to ace window
(global-set-key (kbd "C-x o") 'ace-window)

;; helm (for smarter autocompletion)
(require 'helm-config)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)

(require 'doc-view)
(setq doc-view-resolution 200)

(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; ignore certain file extensions in dired
(require 'dired-x)
(setq-default dired-omit-files-p t) ; this is buffer-local variable
(setq dired-omit-files
    (concat dired-omit-files "\\|^\\..+$\\|\\.log$\\|\\.aux$\\|\\.rip$\\|\\.prv$\\"))
(setq dired-omit-files (concat dired-omit-files "\\|^\\..+$"))

;; disable auto-save
(setq create-lockfiles nil)
