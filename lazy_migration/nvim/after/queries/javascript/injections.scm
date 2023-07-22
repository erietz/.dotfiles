; extends


; https://github.com/nvim-treesitter/nvim-treesitter/blob/master/queries/ecma/injections.scm

((string) @sql
  (#lua-match? @sql "%s*SELECT")
  (#offset! @sql 0 1 0 -1))

((string) @sql
  (#lua-match? @sql "%s*UPDATE")
  (#offset! @sql 0 1 0 -1))

((string) @sql
  (#lua-match? @sql "%s*DELETE")
  (#offset! @sql 0 1 0 -1))

((string) @sql
  (#lua-match? @sql "%s*INSERT")
  (#offset! @sql 0 1 0 -1))

((string) @sql
  (#lua-match? @sql "%s*CREATE")
  (#offset! @sql 0 1 0 -1))

((template_string) @sql
  (#lua-match? @sql "%s*SELECT")
  (#offset! @sql 0 1 0 -1))

((template_string) @sql
  (#lua-match? @sql "%s*UPDATE")
  (#offset! @sql 0 1 0 -1))

((template_string) @sql
  (#lua-match? @sql "%s*DELETE")
  (#offset! @sql 0 1 0 -1))

((template_string) @sql
  (#lua-match? @sql "%s*INSERT")
  (#offset! @sql 0 1 0 -1))

((template_string) @sql
  (#lua-match? @sql "%s*CREATE")
  (#offset! @sql 0 1 0 -1))


; https://github.com/gbprod/php-enhanced-treesitter.nvim/blob/main/queries/php/injections.scm

; (template_string (string_value) @sql
;     (#lua-match? @sql "^%s*SELECT")
;     (#exclude_children! @sql))
; (template_string (string_value) @sql
;     (#lua-match? @sql "^%s*UPDATE")
;     (#exclude_children! @sql))
; (template_string (string_value) @sql
;     (#lua-match? @sql "^%s*DELETE")
;     (#exclude_children! @sql))
; (template_string (string_value) @sql
;     (#lua-match? @sql "^%s*CREATE")
;     (#exclude_children! @sql))
; (template_string (string_value) @sql
;     (#lua-match? @sql "^%s*INSERT")
;     (#exclude_children! @sql))
; (template_string (string_value) @sql
;     (#lua-match? @sql "^%s*REPLACE")
;     (#exclude_children! @sql))
; (template_string (string_value) @sql
;     (#lua-match? @sql "^%s*DROP")
;     (#exclude_children! @sql))
; (template_string (string_value) @sql
;     (#lua-match? @sql "^%s*ALTER")
;     (#exclude_children! @sql))
; (template_string (string_value) @sql
;     (#lua-match? @sql "^%s*EXPLAIN")
;     (#exclude_children! @sql))

; (encapsed_string (string_value) @sql
;     (#lua-match? @sql "^%s*SELECT")
;     (#exclude_children! @sql))
; (encapsed_string (string_value) @sql
;     (#lua-match? @sql "^%s*UPDATE")
;     (#exclude_children! @sql))
; (encapsed_string (string_value) @sql
;     (#lua-match? @sql "^%s*DELETE"))
; (encapsed_string (string_value) @sql
;     (#lua-match? @sql "^%s*CREATE")
;     (#exclude_children! @sql))
; (encapsed_string (string_value) @sql
;     (#lua-match? @sql "^%s*INSERT")
;     (#exclude_children! @sql))
; (encapsed_string (string_value) @sql
;     (#lua-match? @sql "^%s*REPLACE")
;     (#exclude_children! @sql))
; (encapsed_string (string_value) @sql
;     (#lua-match? @sql "^%s*DROP")
;     (#exclude_children! @sql))
; (encapsed_string (string_value) @sql
;     (#lua-match? @sql "^%s*ALTER")
;     (#exclude_children! @sql))
; (encapsed_string (string_value) @sql
;     (#lua-match? @sql "^%s*EXPLAIN")
;     (#exclude_children! @sql))
