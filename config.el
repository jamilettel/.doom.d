;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Jamil Ettel"
      user-mail-address "jamil.ettel@epitech.eu")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get
;; information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq doom-theme 'doom-challenger-deep)
(setq doom-themes-treemacs-theme "doom-colors")

(global-set-key (kbd "<f8>") 'treemacs-select-window)
(global-set-key (kbd "C-<tab>") 'other-window)

(defun prev-window()
  "Switches to previous window."
  (interactive)
  (other-window -1))
(global-set-key (kbd "C-<iso-lefttab>") 'prev-window)

(require 'treemacs)
(treemacs-git-mode 'extended)

(add-hook! 'magit-mode-hook (emojify-mode 1))
(add-hook! 'text-mode-hook (emojify-mode 1))
(add-hook! 'prog-mode-hook
  (lambda ()
    (interactive)
    (global-set-key (kbd "C-<right>") 'forward-word)
    (global-set-key (kbd "C-<left>") 'backward-word)
    ))

(load! "epitech/std_comment.el")

(require 'vterm)
(define-key vterm-mode-map (kbd "<C-backspace>")
    (lambda () (interactive) (vterm-send-key (kbd "C-w"))))

(add-hook! 'vterm-mode-hook (local-set-key (kbd "C-<left>") 'vterm-send-M-b))
(add-hook! 'vterm-mode-hook (local-set-key (kbd "C-<right>") 'vterm-send-M-f))

(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

(global-set-key (kbd "C-c <right>") 'winner-redo)
(global-set-key (kbd "C-c <left>") 'winner-undo)
(global-set-key (kbd "C-x y") 'company-yasnippet)

(global-set-key (kbd "C-x C-g") 'goto-line)
(whole-line-or-region-global-mode t)

(setq doom-font (font-spec :family "Source Code Pro" :size 12))

(doom/set-indent-width 4)
(global-set-key (kbd "M-RET") 'lsp-execute-code-action)

(setq company-idle-delay 0.1)

(blink-cursor-mode 1)

(global-set-key (kbd "C-.") 'comment-line)

(global-set-key (kbd "M-{") 'mc/mark-next-like-this)
(global-set-key (kbd "M-}") 'mc/unmark-next-like-this)
(setq lsp-file-watch-threshold 1000000)

(setq ws-butler-keep-whitespace-before-point t)
