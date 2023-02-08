(setq user-full-name "Mark Graham-Smith"
      user-mail-address "markianjosephsmith@gmail.com")

(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(setq-default flycheck-checker-error-threshold 1000)
(setq-default lsp-file-watch-threshold 50000)

(setq scroll-margin 20)

(setq-default dtrt-indent-max-offset 4)
(setq-default tab-width 4)

(setq display-line-numbers-type 'relative)

(set-face-foreground 'line-number-current-line "#EBBF83")

(setq doom-font
  (font-spec :family "FiraCode Nerd Font" :size 14))
(setq default-text-properties '(line-spacing 0.4 line-height 1.4))

(setq doom-theme 'doom-city-lights)
;; (custom-theme-set-faces!
;;   '(font-lock-variable-name-face)
;;   )
;; (setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-tokyo-night)

(when (display-graphic-p)
  (toggle-frame-maximized)
  (custom-theme-set-faces! 'doom-city-lights
     '(tree-sitter-hl-face:variable :foreground "#EBBF83")

     ;; Controls self in php
     '(tree-sitter-hl-face:variable.builtin :foreground "pink")

     ;; Alters property colours in php ->COLOUR
     ;; '(tree-sitter-hl-face:property :foreground "green")

     ;; These seem to do nothing (Tested in PHP)
     ;; '(tree-sitter-hl-face:variable.parameter :foreground "#ff0000")
     ;; '(tree-sitter-hl-face:variable.special :foreground "#ff0000")
     ;; '(tree-sitter-hl-face:property.definition :foreground "yellow")
    )
  )

(setq org-directory "~/org/")

(after! evil-snipe
  (evil-define-key* '(motion normal) evil-snipe-local-mode-map
    "s" #'evil-avy-goto-char-2))

(map!
  :after evil-snipe
  :nv "s" #'evil-avy-goto-char-2
  )

(use-package! evil-terminal-cursor-changer
  :hook (tty-setup . evil-terminal-cursor-changer-activate))

(defun +vterm-toggle ()
  "Switch to terminal buffer or create and switch"
  (interactive)
  (if (get-buffer "*vterm*")
    (if (equal (get-buffer "*vterm*") (current-buffer))
      (evil-switch-to-windows-last-buffer)
      (switch-to-buffer "*vterm*")
      )
    (call-interactively #'+vterm/here)))

(map!
 :nvi "C-," #'+vterm-toggle
 )

(map!
  :after evil
  :leader
  :nvi "w -" #'evil-window-split
  :nvi "w |" #'evil-window-vsplit
  )

(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(map!
 :nv "C-/" #'comment-line
 )

(defun +edit-indirect-set-mode-before-init (begin end)
  "Set the mode to be used by the indirect region, and then call indirect region"
  (interactive "r")
  (cond
   ((stringp mode-name)
    (setq indirect-region-mode mode-name))
   ((listp mode-name)
    (setq indirect-region-mode (nth 0 mode-name)))
   )

  (switch-to-buffer (edit-indirect-region begin end)))

(defun +edit-indirect-set-mode ()
  (when (and (boundp 'indirect-region-mode) (stringp indirect-region-mode))
    (funcall
     (pcase indirect-region-mode
       ("Rustic" #'rustic-mode)
       ("Web" #'web-mode) ;; Has issues with PHP highlighting?
       ("PHP//l" #'php-mode)
       ("ELisp" #'emacs-lisp-mode)
       ))))

(add-hook 'edit-indirect-after-creation-hook '+edit-indirect-set-mode)

(map!
  :leader
  :v "fi" #'+edit-indirect-set-mode-before-init
  )

(setq shell-file-name "zsh")
(setq shell-command-switch "-ic")
(defun vs/gupnode ()
  "Visualsoft Gupnode Support"
  (interactive)
  (if (and
         (stringp doom-modeline--project-root)
         (or
          (string= doom-modeline--project-root "/Users/markgraham-smith/Code/Projects/vscommerce3/")
          (string= doom-modeline--project-root "/Users/markgraham-smith/Code/Projects/vscommerce3/client_specifics/")
          )
         )
      (progn
        (let ((default-directory doom-modeline--project-root)) (shell-command (concat
                                                                                "gupnode "
                                                                                (read-string "Gupnode: ")
                                                                                )))
        (message "Done")
       )
    (message "fuck off?")
    )
  )

(map!
 :leader
 :n "v" #'vs/gupnode
 )

(after! org
  (require 'org-bullets)
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  )

(after! web-mode
  (setq web-mode-script-padding 0)
  )
