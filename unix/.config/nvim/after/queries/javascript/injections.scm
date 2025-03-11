;; Place this in ~/.config/nvim/after/queries/javascript/injections.scm

((template_string) @injection.content
  (#match? @injection.content "\\s*(SELECT|INSERT|UPDATE|DELETE|CREATE|ALTER|DROP)")
  (#set! injection.language "sql"))

((string) @injection.content
  (#match? @injection.content "\\s*(SELECT|INSERT|UPDATE|DELETE|CREATE|ALTER|DROP)")
  (#set! injection.language "sql"))

((assignment_expression
  left: (member_expression
    property: (property_identifier) @_prop)
  right: [(template_string) (string)] @injection.content)
  (#eq? @_prop "sql")
  (#set! injection.language "sql"))

((call_expression
  function: ((member_expression
    property: (property_identifier) @_prop))
  arguments: ((template_string) @injection.content))
  (#match? @_prop "^(query|sql|exec|execute)$")
  (#set! injection.language "sql"))

((call_expression
  function: ((member_expression
    property: (property_identifier) @_prop))
  arguments: ((string) @injection.content))
  (#match? @_prop "^(query|sql|exec|execute)$")
  (#set! injection.language "sql"))