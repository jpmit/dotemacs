;; .emacs.el - my emacs configuration file
;; James Mithen
;; j.mithen@surrey.ac.uk
;;
;; This is a bit of a mess at the moment, but it gets the job done.

;; use spaces rather than tabs everywhere
(setq-default indent-tabs-mode nil)

;; any other elisp is found here
(add-to-list 'load-path "~/el")

;; dont beep but flash when reach end of buffer
(setq visible-bell t)

;; nice font
(setq default-frame-alist '((font . "terminus")))
(set-face-attribute 'default nil :height 120)

;; syntax highlighting
(global-font-lock-mode t)

;; mail stuff !!
(setq user-full-name "James Mithen")
(setq user-mail-address "j.mithen@surrey.ac.uk")

;; latex stuff 
;(ispell-change-dictionary "american" t)
(ispell-change-dictionary "british" t)
(setq tex-dvi-view-command "evince")
(setq TeX-output-view-style (quote (
("^pdf$" "." "evince %o")
("^ps$" "." "gv %o")
("^dvi$" "." "evince %o")
)))
(setq tex-dvi-view-command "evince")
(setq tex-dvi-print-command "dvips")
(setq tex-alt-dvi-print-command "dvips")
;; use evince for dvi and pdf viewer
;; evince-dvi backend should be installed
(setq TeX-view-program-selection
      '((output-dvi "DVI Viewer")
        (output-pdf "PDF Viewer")
        (output-html "Google Chrome")))
(setq TeX-view-program-list
      '(("DVI Viewer" "evince %o")
        ("PDF Viewer" "evince %o")
        ("Google Chrome" "google-chrome %o")))
(add-hook 'laTeX-mode-hook
          (lambda ()
            (setq fill-column 120)))
(setq fill-column 100)

;; word count function
(defun wordc ()
  (interactive)
  (shell-command-on-region (point)
                           (mark)
                           (concat "texcount.pl -brief " (buffer-name))
                            nil nil))

;; spellcheck document as it is written
(add-hook 'LaTeX-mode-hook 'flyspell-mode)

;; enable cut and paste in x 
(setq x-select-enable-clipboard t)

;; line numbering
(require 'linum)

;; set up ipython as default python interpreter this is slightly black
;; magic.  It shouldn't be needed in more recent emacs versions (>23?)
(require 'python-mode)
(require 'ipython)
(require 'comint)

;; colors for ipython can be NoColor, LightBG or Linux
(setq py-python-command-args '("--pylab" "--colors" "LightBG"))

;; stuff for fortran programming
(add-hook 'f90-mode-hook
    (lambda () (local-set-key (kbd "RET") 'reindent-then-newline-and-indent)))
(setq auto-mode-alist (cons '(".F90$" . f90-mode) auto-mode-alist))

;; this is a fonts .el file I found
(require 'font-menus)

;; remove the big chunky buttons from gui
(tool-bar-mode -1)

;; show column number at bottom of screen
(column-number-mode 1)

;; tramp - this allows you to ssh into localhost as root
;; and hence edit files as root in the same emacs session
;; (require 'tramp)
;; (setq tramp-default-method "scp")

;; no tabs
(setq-default indent-tabs-mode nil)

;; here is some stuff for c programming
(setq c-default-style "k&r")
(require 'cc-mode)
(setq-default tab-width 3)
(setq tab-width 3)
(setq c-basic-offset 3)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
