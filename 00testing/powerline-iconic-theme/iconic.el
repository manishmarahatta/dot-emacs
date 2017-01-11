
(mode-icons-mode)

(setq powerline-default-separator 'wave)

;; Make a face for the octicons font (must be installed on your system)
;; https://octicons.github.com/
(make-face 'octicons)
(set-face-attribute 'octicons nil
                    :family "octicons")
(setq octicon-mark-github  "  ")

(defun powerline-simpler-vc-mode(s)
  ;; (seq s (powerline-vc powerline-active1 'r))
  (if s
      (replace-regexp-in-string " Git[@:-]" "" s)
    s)
  )

(defvar mode-line-cleaner-alist
  `((auto-complete-mode . "")
    (yas-minor-mode . #("YASnippet " 0 9 (display (image :type xpm :file "~/.emacs.d/plug-ins/icons/yas.xpm" :ascent center))))
    (hs-minor-mode . #("hs " 0 2 (display (image :type xpm :file "~/.emacs.d/plug-ins/icons/hs.xpm" :ascent center))))
    (markdown-mode . "")
    (auto-dim-other-buffers-mode . "")
    (highline-mode . "")
    (highlight-indentation-mode . "")
    (anzu-mode . "")
    (smooth-scroll-mode . "")
    (undo-tree-mode . ""))
  "Alist for `clean-mode-line'.
When you add a new element to the alist, keep in mind that you
must pass the correct minor/major mode symbol and a string you
want to use in the modeline *in lieu of* the original.")

(defun clean-mode-line ()
  (interactive)
  (loop for cleaner in mode-line-cleaner-alist
        do (let* ((mode (car cleaner))
                 (mode-str (cdr cleaner))
                 (old-mode-str (cdr (assq mode minor-mode-alist))))
             (when old-mode-str
                 (setcar old-mode-str mode-str))
               ;; major mode
             (when (eq mode major-mode)
               (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)


(defun powerline-iconic-theme()
  "Setup the powerline-iconic theme"
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          (powerline-current-separator)
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           (powerline-current-separator)
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list (powerline-raw "%*" nil 'l)
                                     (when powerline-display-mule-info
                                       (powerline-raw mode-line-mule-info nil 'l))
                                     (powerline-raw " ")
                                     (funcall separator-left mode-line face2)
                                     (when (and (boundp 'erc-track-minor-mode) erc-track-minor-mode)
                                       (powerline-raw erc-modified-channels-object face1 'l))
                                     (powerline-major-mode face2 'l)
                                     (powerline-raw " " face2)
                                     (funcall separator-right face2 face1)
                                     (powerline-process face1)
                                     (powerline-minor-modes face1 'l)
                                     (powerline-narrow face1 'l)
                                     (powerline-raw " " face1)
                                     (powerline-zigzag-left face1 nil)
                                     (when (and (boundp 'which-func-mode) which-func-mode)
                                       (powerline-raw which-func-format nil 'l))))
                          (rhs (list (powerline-raw global-mode-string face1 'r)
                                     (when (vc-backend buffer-file-name)
                                       (funcall separator-left nil face2))
                                     (when (vc-backend buffer-file-name)
                                       (powerline-raw octicon-mark-github face2))
                                     ;; (powerline-vc face2 'r)
                                     (powerline-simpler-vc-mode (powerline-vc face2 'r))
                                     (if (vc-backend buffer-file-name)
                                         (funcall separator-right face2 face1)
                                       (powerline-zigzag-left nil face1))
                                     (powerline-raw "%4l" face1 'r)
                                     (powerline-raw ":" face1 'r)
                                     (powerline-raw "%3c," face1 'r)
                                     (powerline-raw "%6p" face1 'r)
                                     )))
                     (concat (powerline-render lhs)
                             (powerline-fill nil (powerline-width rhs))
                             (powerline-render rhs))
)))))