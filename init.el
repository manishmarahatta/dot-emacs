;;======================================================================
;;; emacs config file for 25.0
;;======================================================================

(setq user-full-name "Manish Marahatta(r68bux)"
      user-mail-address "me@manishmarahatta.com.np")

;; debug on C-g; to point broken modules
;; (setq debug-on-quit t)

;;----------------------------------------------------------------------
;;; load main config via org
(org-babel-load-file "~/.emacs.d/README.org")

;;======================================================================
;;; EMACS AUTO GEN-STUFFS

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(setq-default initial-scratch-message
              (concat ";; Happy hacking, " user-login-name " - Emacs ♥ you!\n\n"))
(setq ring-bell-function 'ignore)
(set-face-attribute 'default nil :height 165)
(display-time-mode 1)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(android-mode-sdk-dir "/opt/android")
 '(ansi-color-names-vector
   [("#000000" "#e74c3c" "#b6e63e" "#e2c770" "#268bd2" "#fb2874" "#66d9ef" "#ffffff")])
 '(custom-safe-themes
   (quote
    ("0eef522d30756a80b28333f05c7eed5721f2ba9b3eaaff244ea4c6f6a1b8ac62" "f67652440b66223b66a4d3e9c0ddeddbf4a6560182fa38693bdc4d940ce43a2e" "8d737627879eff1bbc7e3ef1e9adc657207d9bf74f9abb6e0e53a6541c5f2e88" "0f0022c8091326c9894b707df2ae58dd51527b0cf7abcb0a310fb1e7bda78cd2" "5310b88333fc64c0cb34a27f42fa55ce371438a55f02ac7a4b93519d148bd03d" default)))
 '(fci-rule-color "#555556")
 '(grep-command "grep --color -nH -r -e ")
 '(inhibit-startup-screen t)
 '(jdee-db-active-breakpoint-face-colors (cons "#000000" "#fd971f"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#000000" "#b6e63e"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#000000" "#525254"))
 '(magit-diff-refine-hunk (quote all))
 '(menu-bar-mode nil)
 '(org-ellipsis "  ")
 '(org-fontify-done-headline t)
 '(org-fontify-quote-and-verse-blocks t)
 '(org-fontify-whole-heading-line t)
 '(package-selected-packages
   (quote
    (sos emacs-xkcd hideshowvis fullscreen-mode fullframe octicons google-this helm wget twittering-mode)))
 '(python-shell-completion-native-enable nil)
 '(safe-local-variable-values
   (quote
    ((eval ignore-errors "Write-contents-functions is a buffer-local alternative to before-save-hook"
           (add-hook
            (quote write-contents-functions)
            (lambda nil
              (delete-trailing-whitespace)
              nil))
           (require
            (quote whitespace))
           "Sometimes the mode needs to be toggled off and on."
           (whitespace-mode 0)
           (whitespace-mode 1))
     (whitespace-line-column . 80)
     (whitespace-style face tabs trailing lines-tail)
     (eval outline-hide-sublevels 1)
     (lisp-mode . t)
     (eval server-force-delete))))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(vc-annotate-background "#000000")
 '(vc-annotate-color-map
   (list
    (cons 20 "#b6e63e")
    (cons 40 "#c4db4e")
    (cons 60 "#d3d15f")
    (cons 80 "#e2c770")
    (cons 100 "#ebb755")
    (cons 120 "#f3a73a")
    (cons 140 "#fd971f")
    (cons 160 "#fc723b")
    (cons 180 "#fb4d57")
    (cons 200 "#fb2874")
    (cons 220 "#f43461")
    (cons 240 "#ed404e")
    (cons 260 "#e74c3c")
    (cons 280 "#c14d41")
    (cons 300 "#9c4f48")
    (cons 320 "#77504e")
    (cons 340 "#555556")
    (cons 360 "#555556")))
 '(vc-annotate-very-old-color nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:slant oblique))))
 '(font-lock-function-name-face ((t (:foreground "#cae682" :slant oblique :weight bold))))
 '(font-lock-keyword-face ((t (:foreground "cyan" :weight bold))))
 '(font-lock-string-face ((t (:foreground "gold2" :weight semi-light :family "Source Code Pro"))))
 '(font-lock-variable-name-face ((t (:foreground "sandy brown"))))
 '(font-lock-warning-face ((t (:background "yellow1" :foreground "red1" :weight bold))))
 '(linum ((t (:inherit (shadow default) :height 108))))
 '(markdown-header-delimiter-face ((t (:inherit font-lock-function-name-face :weight bold))) t)
 '(markdown-header-face-1 ((t (:height 1.8))) t)
 '(markdown-header-face-2 ((t (:height 1.6))) t)
 '(markdown-header-face-3 ((t (:height 1.4))) t)
 '(markdown-header-face-4 ((t (:height 1.2))) t)
 '(markdown-header-face-5 ((t (:height 1.1 :weight bold))) t)
 '(markdown-header-face-6 ((t (:weight bold))) t)
 '(show-paren-match ((t (:inverse-video t))))
 '(which-func ((t (:background "gray40")))))
