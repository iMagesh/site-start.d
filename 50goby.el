;;; 50goby.el --- Debian goby startup file  -*-mode: emacs-lisp;-*-

(let* ((pkg "goby")
       (flavor-name (if (boundp 'debian-emacs-flavor)
			(symbol-name debian-emacs-flavor)
		      "emacs"))
       (pkg-inst (concat "/usr/lib/emacsen-common/packages/install/" pkg))
       (elc-dir (concat "/usr/share/" flavor-name "/site-lisp/" pkg)))
  (when (and (file-exists-p elc-dir)
	     (file-exists-p pkg-inst))
    (if (fboundp 'debian-pkg-add-load-path-item)
	(debian-pkg-add-load-path-item elc-dir)
      (setq load-path (cons elc-dir load-path)))
    ;;
    (autoload 'goby "goby" nil t)
    (setq goby-use-advanced-window-manager t)
    ;;
    ))

;;; 50goby.el ends here
