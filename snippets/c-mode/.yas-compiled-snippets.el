;;; Compiled snippets and support files for `c-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'c-mode
		     '(("fopen" "FILE *${fp} = fopen(${\"file\"}, \"${r}\");" "FILE *fp = fopen(..., ...);" nil nil nil nil nil nil)
		       ("printf" "printf (\"${1:%s}\\\\n\"${1:$(if (string-match \"%\" text) \",\" \"\\);\")\n}$2${1:$(if (string-match \"%\" text) \"\\);\" \"\")}" "printf" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Sun Jul 21 09:56:49 2013
