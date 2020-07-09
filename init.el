(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (rainbow-delimiters evil-nerd-commenter evil-leader yasnippet-snippets yasnippet which-key anaconda-mode anaconda company-anaconda flycheck company org evil smartparens smartparens-config material-theme counsel swiper use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(set-frame-font "Hack-14")
(set-fontset-font "fontset-default" 'unicode "WenQuanYi Micro Hei Mono 14")
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(global-linum-mode t)
(show-paren-mode t)

(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package material-theme
  :ensure t
  :init (load-theme 'material t))

(use-package counsel
  :ensure t)
(use-package swiper
  :ensure t
  :init
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    ;; enable this if you want `swiper' to use it
    (setq search-default-mode #'char-fold-to-regexp)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
    (global-set-key (kbd "<f1> l") 'counsel-find-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)))

(use-package which-key
  :ensure t
  :init (which-key-mode))

(use-package evil-leader
  :ensure t
  :init
  (progn
    (global-evil-leader-mode)
    (evil-leader/set-key
     ;; evil-nerd-commenter vim key bindings
     "ci" 'evilnc-comment-or-uncomment-lines
     "cc" 'evilnc-copy-and-comment-lines
     "cp" 'evilnc-comment-or-uncomment-paragraphs
)))

(use-package evil
  :ensure t
  :init
  (progn
    (evil-mode 1)
    (setcdr evil-insert-state-map nil)
    (define-key evil-insert-state-map [escape] 'evil-normal-state)))

(use-package company
  :ensure t
  :init
  (progn
    (global-company-mode)
    (setq company-show-numbers t)
    (setq company-idle-delay 0.2)
    (setq company-minimum-prefix-length 1)))

(use-package anaconda-mode
  :ensure t
  :init
  (progn
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
    (add-hook 'python-mode-hook 'anaconda-mode)))

(use-package company-anaconda
  :ensure t
  :init (eval-after-load "company" '(add-to-list 'company-backends 'company-anaconda)))

(use-package smartparens
  :ensure t
  :init (smartparens-global-mode))

(use-package rainbow-delimiters
  :ensure t
  :init (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package highlight-indent-guides
  :ensure t
  :init
  (progn
    (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
    (setq highlight-indent-guides-method 'character)
    (setq highlight-indent-guides-character ?|)))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package undo-tree
  :ensure t
  :init (global-undo-tree-mode))

(use-package yasnippet
  :ensure t
  :init (yas-global-mode))
(use-package yasnippet-snippets
  :ensure t)

(use-package evil-nerd-commenter
  :ensure t)

(progn
  (ido-mode t)
  (setq ido-enable-flex-matching t)
  (setq ido-everywhere t))

;;; init.el ends here
