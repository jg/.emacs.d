(require 'find-file-in-project)
(setq *find-file-in-project-project-roots*
      '(".git" ".hg"))
(setq *find-file-in-project-gf-exclude*
      "\\.git|/vendor/|/fixtures/|/tmp/|/log/")

; (setq find-file-in-project-use-file-cache nil)
; (find-file-in-project-mode)
