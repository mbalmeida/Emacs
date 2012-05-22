(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/sites-lisp/")
(add-to-list 'load-path "~/.emacs.d/elisp/")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/emacs-goodies-el/")

(scroll-bar-mode  -1)
(tool-bar-mode    -1)
(global-linum-mode 1)
(show-paren-mode   1)

(add-hook 'c-mode-hook (function (lambda ()
  (modify-syntax-entry ?_ "word"))))

(put 'kill-ring-save 'interactive-form
     '(interactive
       (if (use-region-p)
           (list (region-beginning) (region-end))
         (list (line-beginning-position) (line-beginning-position 2)))))

(put 'kill-region 'interactive-form
     '(interactive
       (if (use-region-p)
           (list (region-beginning) (region-end))
         (list (line-beginning-position) (line-beginning-position 2)))))

(put 'comment-region 'interactive-form
     '(interactive
       (if (use-region-p)
           (list (region-beginning) (region-end))
         (list (line-beginning-position) (line-beginning-position 2)))))

(defun inc-number ()
    (interactive)
    (let ((end (search-forward-regexp "[0-9]+"))
        (beg (search-backward-regexp "[^0-9]+")))
      (forward-char 1)
      (insert 
        (number-to-string
          (+ 1 (string-to-number 
             (delete-and-extract-region (+ beg 1) end)))))
      (backward-char 1)))
      
(global-set-key "\C-q" 'inc-number)

(defun toggle-fullscreen ()
 (interactive)
 (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                          nil
                                          'fullboth)))
(global-set-key [(meta return)] 'toggle-fullscreen)

(require 'color-theme)
(color-theme-initialize)
(color-theme-emacs-21) ;; default when starting emacs

(global-set-key (kbd "M-<f11>") 'color-theme-charcoal-black) ;; Alt-f11
(global-set-key (kbd "M-<f12>") 'color-theme-almost-monokai) ;; Alt-f12

(global-set-key (kbd "C-?") 'undo)

(global-set-key [M-left]  'windmove-left)          ; move to left windnow
(global-set-key [M-right] 'windmove-right)         ; move to right window
(global-set-key [M-up]    'windmove-up)            ; move to upper window
(global-set-key [M-down]  'windmove-down)          ; move to downer window

(set-variable 'scroll-step 1)

;;AutoPair
(require 'autopair)
(autopair-global-mode t)

;;Server-Mode
(server-start)

(defun my-revert-buffer ()
        (interactive)
        (revert-buffer nil t))

(global-set-key "\C-c\C-r" 'my-revert-buffer)
(global-set-key "\C-cr"    'my-revert-buffer)
(global-set-key "\C-cn"    'linum-mode)
(global-set-key "\C-c\C-n" 'linum-mode)

(setq c-default-style "linux")
(setq-default c-basic-offset 4
                   tab-width 4
                   indent-tabs-mode t)

(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
