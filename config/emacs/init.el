;;------------------------------------------------------------------------------
;; Author      : Ethan Rietz
;; Date        : 2021-08-26
;; Description : Emacs Config File
;;------------------------------------------------------------------------------

;; add melpa as a source to install packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; line numbers
(global-display-line-numbers-mode)

(setq-default indent-tab-mode nil
    tab-width 4)

;; zenburn theme installed by m-x list-packages
(load-theme 'zenburn t)

;;------------------------------------------------------------------------------ 
;; evil mode ... I tried the emacs keybindings, I really did.
;;------------------------------------------------------------------------------ 
(evil-mode 1)

;; set leader key in all states
(evil-set-leader nil (kbd "C-SPC"))

;; tpopes vim-commentary emulation
(evil-commentary-mode)

;;------------------------------------------------------------------------------
;; This section is automatically updated when installing packages
;; using m-x list-packages
;;------------------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("3b8284e207ff93dfc5e5ada8b7b00a3305351a3fb222782d8033a400a48eca48" default))
 '(package-selected-packages '(evil-commentary evil magit zenburn-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
