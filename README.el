
(setq gc-cons-threshold 104857600)

(require 'server)
(unless (server-running-p)
  (server-start))

(setq locale-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(when (display-graphic-p)
   (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

(setq backup-directory-alist (quote ((".*" . "~/.cache/emacs_backup/"))))
(setq make-backup-files nil)

(fset 'yes-or-no-p 'y-or-n-p)

;; (recentf-mode nil)

(add-to-list 'load-path "~/.emacs.d/el-get")
(require 'el-get)
(setq el-get-git-shallow-clone 't)
(el-get 'sync)

(setq dim-packages
       (append
;; list of packages we use straight from official recipes
          '(ample-regexps auto-complete cl-lib ctable dash
          deferred ein epc epl exec-path-from-shell f flymake
          flymake-cursor fuzzy git-modes goto-chg jedi json-mode
          json-reformat json-snatcher magit moz-repl multiple-cursors
          pkg-info popup popup-kill-ring pos-tip pylookup python
          python-environment recentf-ext request s undo-tree
          web-mode websocket yasnippet ac-helm outorg outshine package)
        (mapcar 'el-get-as-symbol (mapcar 'el-get-source-name
        el-get-sources))))
(el-get 'sync dim-packages)

(load "~/.emacs.d/config/ui.cfg.el")

(global-unset-key [(control prior)])
(global-unset-key [(control next)])

(el-get 'sync 'fill-column-indicator)
(require 'fill-column-indicator)
(global-set-key [M-f4] 'save-buffers-kill-terminal)
(global-set-key [(control f5)] '(lambda() (interactive)
                                (load-file "~/.emacs.d/init.el")))
(global-set-key [f6] '(lambda() (interactive)
                      (toggle-truncate-lines)
                      (fci-mode)))
(global-set-key [f9] 'speedbar)

(global-unset-key [(shift down-mouse-1)])
(global-set-key [(shift down-mouse-1)] 'mouse-save-then-kill)

(el-get 'sync 'highline)
(require 'highline)

(set-face-background 'highline-face (shade-color 09))
(add-hook 'prog-mode-hook 'highline-mode-on)

;; not using inbuild hl-line-mode i can't seem to figure out changing
;; face for shade-color
;; (global-hl-line-mode 1)
;; (set-face-background 'hl-line "#3e4446")
;; (set-face-foreground 'highlight nil)
;; (set-face-attribute hl-line-face nil :underline nil)

(when window-system
  (require 'undo-tree)
  (global-undo-tree-mode 1)
  (global-unset-key (kbd "C-/"))
  (defalias 'redo 'undo-tree-redo)
  (global-unset-key (kbd "C-z"))
  (global-set-key (kbd "C-z") 'undo-only)
  (global-set-key (kbd "C-S-z") 'redo))

;;; mode-icons directly from repo, for experiments
;;; https://github.com/ryuslash/mode-icons
(load-file "~/.emacs.d/modules/mode-icons/mode-icons.el")
;;; DID YOU GOT STUCK ABOVE? COMMENT LINE ABOVE & UNCOMMENT NEXT 2 LINES
;; (el-get 'sync 'mode-icons)
;; (require 'mode-icons)
;; (setq mode-icons-desaturate-inactive nil)
;; (setq mode-icons-desaturate-active nil)
;; (setq mode-icons-grayscale-transform nil)
(mode-icons-mode)

(el-get 'sync 'powerline)
(require 'powerline)

;;; https://github.com/manishmarahatta/powerline-iconic-theme
;; (add-to-list 'load-path "~/.emacs.d/modules/powerline-iconic-theme/")
;;(load-file "~/.emacs.d/modules/powerline-iconic-theme/iconic.el")
;;(powerline-iconic-theme)
;;; DID YOU GOT STUCK ABOVE? COMMENT 2 LINES ABOVE & UNCOMMENT NEXT LINE
(powerline-default-theme)

;;; modeline from spacmacs
;;; https://github.com/TheBB/spaceline
;; (add-to-list 'load-path  "~/.emacs.d/modules/spaceline/")
;; (require 'spaceline-config)
;; (spaceline-spacemacs-theme)

(el-get 'sync 'tabbar)
(require 'tabbar)
(tabbar-mode t)


;;; tabbar-ruler directly from repo, for experiments
;;; https://github.com/mattfidler/tabbar-ruler.el
(load-file "~/.emacs.d/modules/tabbar-ruler/tabbar-ruler.el")
;;; DID YOU GOT STUCK ABOVE? COMMENT LINE ABOVE & UNCOMMENT NEXT 2
;; (el-get 'sync 'tabbar-ruler)
;; (require 'tabbar-ruler)

(setq tabbar-ruler-style 'firefox)

(load "~/.emacs.d/config/tabbar.cfg.el")
(global-set-key [f7] 'tabbar-mode)

(define-key global-map [(control tab)] 'tabbar-forward)
(define-key global-map [(control next)] 'tabbar-forward)
(define-key global-map [(control prior)] 'tabbar-backward)
(define-key global-map (kbd "C-S-<iso-lefttab>") 'tabbar-backward)

(global-set-key [(control shift prior)] 'tabbar-backward-group)
(global-set-key [(control shift next)] 'tabbar-forward-group)

(el-get 'sync 'smooth-scroll)
(require 'smooth-scroll)
(smooth-scroll-mode t)

(setq linum-delay t)
(setq redisplay-dont-pause t)
(setq scroll-conservatively 0) ;; cursor on the middle of the screen
(setq scroll-up-aggressively 0.01)
(setq scroll-down-aggressively 0.01)
(setq auto-window-vscroll nil)

(setq mouse-wheel-progressive-speed 10)
(setq mouse-wheel-follow-mouse 't)

(delete-selection-mode 1)

(ido-mode t)
;;(ido-ubiquitous t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t ;; enable fuzzy matching
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ;; ido-default-file-method 'select-window
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10)

;; (el-get 'sync 'smex)
;; (require 'smex)
;; (smex-initialize)
;; (global-set-key (kbd "M-x") 'smex)

(el-get 'sync 'helm)
 (require 'helm)
 (global-set-key (kbd "M-x") 'helm-M-x)
 (global-set-key (kbd "C-x C-f") 'helm-find-files)
 (helm-mode 1)

(el-get 'sync 'anzu)
(require 'anzu)
(global-anzu-mode +1)
(global-unset-key (kbd "M-%"))
(global-unset-key (kbd "C-M-%"))
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)

(when window-system
  (el-get 'sync 'multiple-cursors)
  (require 'multiple-cursors)
  (global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click))

(el-get 'sync 'goto-chg)
(require 'goto-chg)
(global-unset-key (kbd "C-j"))
(global-set-key (kbd "C-j") 'goto-last-change)

;; (el-get 'sync 'switch-window)
;; (require 'switch-window)
;; (global-set-key (kbd "C-x o") 'switch-window)

(el-get 'sync 'emojify)
(require 'emojify)

(add-hook 'org-mode-hook 'emojify-mode)
(add-hook 'markdown-mode-hook 'emojify-mode)
(add-hook 'git-commit-mode-hook 'emojify-mode)

(setq-default comment-start "# ")

(add-hook 'prog-mode-hook 'which-function-mode)
(add-hook 'prog-mode-hook 'toggle-truncate-lines)

(setq show-paren-style 'expression)
(show-paren-mode 1)

(defun watch-words ()
  (interactive)
  (font-lock-add-keywords
   nil '(("\\<\\(FIX ?-?\\(ME\\)?\\|TODO\\|BUGS?\\|TIPS?\\|TESTING\\|WARN\\(ING\\)?S?\\|WISH\\|IMP\\|NOTE\\)"
          1 font-lock-warning-face t))))

(add-hook 'prog-mode-hook 'watch-words)

(el-get 'sync 'highlight-symbol)
(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [(shift f3)] 'highlight-symbol-next)
(global-set-key [(shift f2)] 'highlight-symbol-prev)

(global-unset-key (kbd "<C-down-mouse-1>"))
(global-set-key (kbd "<C-down-mouse-1>")
           (lambda (event)
             (interactive "e")
             (save-excursion
               (goto-char (posn-point (event-start event)))
               (highlight-symbol-at-point))))

(defun nuke_traling ()
  (add-hook 'write-file-hooks 'delete-trailing-whitespace)
  (add-hook 'before-save-hooks 'whitespace-cleanup))

(add-hook 'prog-mode-hook 'nuke_traling)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(load "~/.emacs.d/config/compile.cfg.el")

(el-get 'sync 'fill-column-indicator)
(require 'fill-column-indicator)
(defun my-compilation-mode-hook ()
  (setq truncate-lines nil) ;; automatically becomes buffer local
  (set (make-local-variable 'truncate-partial-width-windows) nil)
  (toggle-truncate-lines)
  (fci-mode))
(add-hook 'compilation-mode-hook 'my-compilation-mode-hook)

(global-set-key (kbd "C-<f8>") 'save-and-compile-again)
(global-set-key (kbd "C-<f9>") 'ask-new-compile-command)
(global-set-key (kbd "<f8>") 'toggle-compilation-buffer)

(el-get 'sync 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))

(add-hook 'python-mode-hook 'ggtags-mode)

(global-set-key (kbd "<C-double-mouse-1>") 'ggtags-find-tag-mouse)

(setq c-tab-always-indent t)
(setq c-basic-offset 4)
(setq c-indent-level 4)

(require 'cc-mode)
(c-set-offset 'substatement-open 0)
(c-set-offset 'arglist-intro '+)
(add-hook 'c-mode-common-hook '(lambda() (c-toggle-hungry-state 1)))
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

(setq-default py-indent-offset 4)

(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t) ; optional
;; (setq jedi:setup-keys t) ; optional

;; (add-to-list 'load-path "~/.emacs.d/pydoc-info")
;; (require 'pydoc-info)
;; (require 'info-look)

;; (setq pdb-path '/usr/lib/python2.4/pdb.py
;; gud-pdb-command-name (symbol-name pdb-path))

;; (defadvice pdb (before gud-query-cmdline activate) "Provide a
;; better default command line when called interactively."
;; (interactive (list (gud-query-cmdline pdb-path
;; (file-name-nondirectory buffer-file-name)))))

;; (add-to-list 'load-path "~/.emacs.d/modules/py-exec/")
;; (require 'py-exec)
(load "~/.emacs.d/modules/py-exec/py-exec.el")

(setq lua-indent-level 4)

(setq default-tab-width 4)

;;  (load "~/.emacs.d/config/html.cfg.el")

(add-hook 'xwidget-webkit-mode (lambda ()
  (define-key xwidget-webkit-mode-map [mouse-4] 'xwidget-webkit-scroll-down)
  (define-key xwidget-webkit-mode-map [mouse-5] 'xwidget-webkit-scroll-up)
  (define-key xwidget-webkit-mode-map (kbd "<up>") 'xwidget-webkit-scroll-down)
  (define-key xwidget-webkit-mode-map (kbd "<down>") 'xwidget-webkit-scroll-up)
  (define-key xwidget-webkit-mode-map (kbd "M-w") 'xwidget-webkit-copy-selection-as-kill)
  (define-key xwidget-webkit-mode-map (kbd "C-c") 'xwidget-webkit-copy-selection-as-kill)))

(add-hook 'window-configuration-change-hook (lambda ()
               (when (equal major-mode 'xwidget-webkit-mode)
                 (xwidget-webkit-adjust-size-dispatch))))

(defun xwidget-browse-url-no-reuse (url &optional sessoin)
  (interactive (progn
                 (require 'browse-url)
                 (browse-url-interactive-arg "xwidget-webkit URL: ")))
  (xwidget-webkit-browse-url url t))

;; (setq browse-url-browser-function (lambda (url session)
;;                    (other-window 1)
;;                    (xwidget-browse-url-no-reuse url)))

(load "~/.emacs.d/config/org-mode.cfg.el")
(load "~/.emacs.d/config/babel.cfg.el")

(require 'outline)
(add-hook 'prog-mode-hook 'outline-minor-mode)
(add-hook 'compilation-mode-hook 'outline-minor-mode)

(require 'outshine)
(add-hook 'outline-minor-mode-hook 'outshine-hook-function)
;; (add-hook 'outline-minor-mode-hook
;;          '(lambda ()
;;             (define-key org-mode-map (kbd "C-j") nil)))

(el-get 'sync 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile" . dockerfile-mode))

(setq auto-mode-alist
   (cons '("\.json$" . json-mode) auto-mode-alist))

(el-get 'sync 'markdown-mode)
;; disable because markdown creating problem to dockerfile-mode
;; (add-to-list 'auto-mode-alist '("\.md" . markdown-mode))

(when window-system
  (require 'yasnippet)
  (yas-reload-all)
  (add-hook 'prog-mode-hook 'yas-minor-mode-on)
  (add-hook 'org-mode-hook 'yas-minor-mode-on))

(load "~/.emacs.d/scripts/wordplay.el")

(global-set-key (kbd "C-`") 'duplicate-current-line)
(global-set-key (kbd "C-~") 'duplicate-current-word)

(global-set-key (kbd "C-<insert>") 'kill-ring-save-current-line)

(global-set-key [(shift insert)] 'repetitive-yanking)

(add-to-list 'load-path "~/.emacs.d/modules/")

;; (add-to-list 'load-path "~/.emacs.d/modules/emacs-browser-refresh/")
;; (require 'browser-refresh)
;; (setq browser-refresh-default-browser 'firefox)

(add-to-list 'load-path "~/.emacs.d/modules/emacs-ac-emoji/")
(require 'ac-emoji)

(add-hook 'org-mode-hook 'auto-complete-mode)
(add-hook 'org-mode-hook 'ac-emoji-setup)
(add-hook 'markdown-mode-hook 'ac-emoji-setup)
(add-hook 'git-commit-mode-hook 'ac-emoji-setup)

(set-fontset-font
   t 'symbol
     (font-spec :family "Symbola") nil 'prepend)

(add-to-list 'load-path "~/.emacs.d/modules/window-numbering/")
(require 'window-numbering)
(window-numbering-mode)

(add-to-list 'load-path "~/.emacs.d/modules/indent/antonj/")
;;; DID YOU GOT STUCK ABOVE? COMMENT LINE ABOVE & UNCOMMENT NEXT LINE
;; (el-get 'sync 'highlight-indentation)
(require 'highlight-indentation)
(set-face-background 'highlight-indentation-face "olive drab")
(set-face-background 'highlight-indentation-current-column-face "#c3b3b3")

(add-hook 'prog-mode-hook 'highlight-indentation-mode)
(add-hook 'prog-mode-hook 'highlight-indentation-current-column-mode)

(autoload 'hideshowvis-enable "hideshowvis")
(autoload 'hideshowvis-minor-mode
  "hideshowvis"
  "Will indicate regions foldable with hideshow in the fringe."
  'interactive)

(add-hook 'python-mode-hook 'hideshowvis-enable)

(when window-system
  (add-to-list 'load-path "~/.emacs.d/modules/auto-dim-other-buffers.el")
  (require 'auto-dim-other-buffers)
  (add-hook 'after-init-hook (lambda ()
                               (when (fboundp 'auto-dim-other-buffers-mode)
                                 (auto-dim-other-buffers-mode t)))))

(add-to-list 'load-path "~/.emacs.d/modules/colors")
;;; DID YOU GOT STUCK ABOVE? COMMENT LINE ABOVE
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(require 'nlinum)
(setq nlinum-delay t)
(add-hook 'find-file-hook (lambda () (nlinum-mode 1)))

;; (add-to-list 'load-path "~/.emacs.d/modules/isend-mode/")
;; (require 'isend)

;; (setq xle-buffer-process-coding-system 'utf-8)
;; (load-library "/opt/xle/emacs/lfg-mode")

;;(global-wakatime-mode)

(require 'ac-helm)  ;; Not necessary if using ELPA package
(global-set-key (kbd "C-:") 'ac-complete-with-helm)
(define-key ac-complete-mode-map (kbd "C-:") 'ac-complete-with-helm)
