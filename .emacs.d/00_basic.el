;;; ========================================================
;;;
;;; variables
;;;
;;; ========================================================
(setq user-full-name "")
(setq user-mail-address "")

(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;;; ========================================================
;;;
;;; basics
;;;
;;; ========================================================
;;; load-path
(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'install-elisp)
(setq install-elisp-repository-directory "~/.emacs.d/elisp")

;;; backup files
;; *.~
(setq make-backup-files nil)
;; .#*
(setq auto-save-default nil)

;;; scroll
(setq scroll-conservatively 35 scroll-margin 0 scroll-step 1)

;;; key setting
; C-h => Backspace
(global-set-key "\C-h" 'delete-backward-char)

;;; ========================================================
;;;
;;; display
;;;
;;; ========================================================
;; fore - back color
(setq default-frame-alist
      (append(list '(foreground-color . "white")
		   '(background-color . "black"))
	     default-frame-alist))
;; selection area
(setq transient-mark-mode t)
;; transparent
(set-alpha '(85 20))
;; transparent - current window
(set-frame-parameter nil 'alpha 85)
;; fonts
(fixed-width-set-fontset "msgothic" 12)

;; tab, space
(defface my-face-b-1 '((t (:background "gray"))) nil)
(defface my-face-b-2 '((t (:background "gray26"))) nil)
(defface my-face-u-1 '((t (:foreground "SteelBlue" :underline t))) nil)
;;(defvar my-face-r-1 'my-face-r-1)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)
(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("\t" 0 my-face-b-2 append)
     ("Å@" 0 my-face-b-1 append)
     ;;("[ \t]+$" 0 my-face-u-1 append)
     ;;("[\r]*\n" 0 my-face-r-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)

