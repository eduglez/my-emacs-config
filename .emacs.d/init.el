;; https://github.com/pierre-lecocq/emacs4developers/blob/master/chapters/03-building-your-own-editor.org
(setq user-full-name "")
(setq user-mail-address "")

;; Ask "y" or "n" instead of "yes" or "no". Yes, laziness is great.
(fset 'yes-or-no-p 'y-or-n-p)

;; Highlight corresponding parentheses when cursor is on one
(show-paren-mode t)

;; Highlight tabulations
(setq-default highlight-tabs t)

;; Show trailing white spaces
(setq-default show-trailing-whitespace t)

;; Remove useless whitespace before saving a file
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook (lambda() (delete-trailing-whitespace)))

;; Set locale to UTF8
(set-language-environment 'utf-8)
(set-terminal-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Save backup files in a dedicated directory
(setq backup-directory-alist '(("." . "~/.emacs.d/.saves")))

;; Remove all backup files
;; (setq make-backup-files nil)
;; (setq backup-inhibited t)
;; (setq auto-save-default nil)

;; Set up el-get
;; WINDOWS: it needs DLL. Copy bin directory in emacs directory
;; http://www.gnu.org/software/emacs/manual/html_mono/emacs-gnutls.html#Help-For-Users
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

;; List of all wanted packages
(setq
 el-get-packages
 '(
   autopair
   ;;color-theme-solarized
   web-mode
))

(el-get 'sync el-get-packages)

;; Set Unix End of Lines http://stackoverflow.com/questions/1674481/how-to-configure-gnu-emacs-to-write-unix-or-dos-formatted-files-by-default
(set-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-default default-buffer-file-coding-system 'utf-8-unix)

;; Inhibit startup message http://stackoverflow.com/questions/744672/unable-to-hide-welcome-screen-in-emacs
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; No toolbar, menubar and scrollbar http://stackoverflow.com/questions/9423974/emacs-menu-bar-mode-and-tool-bar-mode-automatically-set-to-t
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(setq c-basic-offset 4) ; indents 4 chars
(setq tab-width 4)          ; and 4 char wide for TAB
(setq indent-tabs-mode nil) ; And force use of spaces
(turn-on-font-lock)       ; same as syntax on in Vim


;WEB MODE
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.cshtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
