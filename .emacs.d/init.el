(load "~/.emacs.d/00_basic.el")

;;; auto-complete
(require 'auto-complete)
(global-auto-complete-mode t)

;;; SKK 辞書
(setq skk-large-jisyo "~/.emacs.d/SKK-JISYO.L")

;;; 行番号表示
(require 'linum)
(global-linum-mode t)

;;; sml-modeline
(load "sml-modeline.el")
(sml-mode t)
(set-face-background 'sml-end-face "DarkBlue")
(set-face-background 'sml-vis-face "LightYellow4")

;;; ------------------------------------
;;; タブバー設定
;;; ------------------------------------
(require 'tabbar)
(tabbar-mode)
;; scratch buffer 以外をまとめてタブに表示する
(setq tabbar-buffer-groups-function
      (lambda (b) (list "All Buffers")))
(setq tabbar-buffer-list-function
      (lambda ()
        (remove-if
         (lambda(buffer)
           (find (aref (buffer-name buffer) 0) " *"))
         (buffer-list))))
;; Ctrl-Tab, Ctrl-Shift-Tab でタブを切り替える
(dolist (func '(tabbar-mode tabbar-forward-tab tabbar-forward-group tabbar-backward-tab tabbar-backward-group))
  (autoload func "tabbar" "Tabs at the top of buffers and easy control-tab navigation"))
(defmacro defun-prefix-alt (name on-no-prefix on-prefix &optional do-always)
  `(defun ,name (arg)
     (interactive "P")
     ,do-always
     (if (equal nil arg)
         ,on-no-prefix
       ,on-prefix)))
(defun-prefix-alt shk-tabbar-next (tabbar-forward-tab) (tabbar-forward-group) (tabbar-mode 1))
(defun-prefix-alt shk-tabbar-prev (tabbar-backward-tab) (tabbar-backward-group) (tabbar-mode 1))
(global-set-key [(control tab)] 'shk-tabbar-next)
(global-set-key [(control shift tab)] 'shk-tabbar-prev)
;; タブバー外観変更
(set-face-attribute
 'tabbar-default-face nil
 :background "gray60")
(set-face-attribute
 'tabbar-unselected-face nil
 :background "gray85"
 :foreground "gray30"
 :box nil)
(set-face-attribute
 'tabbar-selected-face nil
 :background "#f2f2f6"
 :foreground "blue"
 :box nil)
(set-face-attribute
 'tabbar-button-face nil
 :box '(:line-width 1 :color "gray72" :style released-button))
(set-face-attribute
 'tabbar-separator-face nil
 :height 0.7)
;; F4でタブバーモード切り替え
(global-set-key [f4] 'tabbar-mode)       


;;; ========================================================
;;; emacsの検索機能を使いこなす
;;; http://dev.ariel-networks.com/articles/emacs/part1/
;;; ========================================================
;;; Grep
(require 'grep-edit)
;;;
;;; anything
;;;
(require 'anything)
(require 'anything-config)
(require 'anything-etags)
(require 'anything-gtags)
(setq anything-sources
      '(anything-c-source-buffers
        anything-c-source-imenu
        ;;anything-c-source-etags-select
        ;;anytning-c-source-etags-select
        ))
(global-set-key (kbd "C-x b") 'anything)

;;; gtags
(require 'gtags)
(add-hook 'java-mode-hook (lambda () (gtags-mode 1)))
(add-hook 'c-mode-hook (lambda () (gtags-mode 1)))
(add-hook 'c++-mode-hook (lambda () (gtags-mode 1)))



;;; ========================================================
;;;
;;; Major mode settings
;;;
;;; ========================================================
;;; PHP-mode -----------------------------------------------
(autoload 'php-mode "php-mode" "Mode for editing php source" t)
(setq auto-mode-alist (append '(("\\.php$" . php-mode)) auto-mode-alist))
(setq php-mode-force-pear t)
(add-hook 'php-mode-user-hook
          '(lambda ()
             (c-set-style "stroustrup")
             (setq tab-width 4)
             (setq c-basic-offset 4)
             (setq indent-tabs-mode nil)))
;;; ruby-mode ----------------------------------------------
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source" t)
(setq auto-mode-alist (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode)) interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))
;;; clojure-mode -------------------------------------------
(autoload 'clojure-mode "clojure-mode" "A major mode for Clojure" t)
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(safe-local-variable-values (quote ((clmemo-mode . t))))
 '(tool-bar-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
;;; gauche-mode -------------------------------------------
(setq process-coding-system-alist
      (cons '("gosh" utf-8 . utf-8) process-coding-system-alist))
(setq scheme-program-name "gosh -i")
(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)

(put 'narrow-to-region 'disabled nil)
