;;; wget-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "wget" "wget.el" (22646 13482 687615 20000))
;;; Generated autoloads from wget.el

(autoload 'wget "wget" "\
Wget interface to download URI asynchronously.
If argument ARG is non-nil, ask some options.
Called with prefix argument, turn argument ARG t.

If you are in dired mode which is seeing ftp directory,
`wget' regard current line file name as URI.

\(fn URI &optional ARG)" t nil)

(autoload 'wget-web-page "wget" "\
Wget interface to download whole Web page.
If argument ARG is non-nil, ask options.
Called with prefix argument, turn argument ARG t.

Second argument URI is string.
wget-web-page downlod whole Web page from it following relative link.

\(fn URI &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("lpath.el" "w3-wget.el" "w3m-wget.el"
;;;;;;  "wget-pkg.el" "wget-sysdep.el") (22646 13483 7615 27000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; wget-autoloads.el ends here
