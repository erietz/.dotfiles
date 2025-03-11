;; Place this in ~/.config/nvim/after/queries/sql/highlights.scm
;; This will override the default SQL highlights

(invocation
  (object_reference
    name: (identifier) @function.call))

[
  (keyword_gist)
  (keyword_btree)
  (keyword_hash)
  (keyword_spgist)
  (keyword_gin)
  (keyword_brin)
  (keyword_array)
] @function.call

(object_reference
  name: (identifier) @type)

(relation
  alias: (identifier) @variable)

(field
  name: (identifier) @variable.member)

(column_definition
  name: (identifier) @variable.member)

(term
  alias: (identifier) @variable)

(term
  value: (cast
    name: (keyword_cast) @function.call
    parameter: (literal)?))

(literal) @string

(comment) @comment @spell

((literal) @number
  (#lua-match? @number "^%d+$"))

((literal) @number.float
  (#lua-match? @number.float "^[-]?%d*\.%d*$"))

(parameter) @variable.parameter

[
  (keyword_true)
  (keyword_false)
] @boolean

;; Rest of original file contents....