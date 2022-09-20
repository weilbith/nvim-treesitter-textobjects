;; functions
(function_definition
  body: (compound_statement . "{" . (_) @_start @_end (_)? @_end . "}"
  (#make-range! "function.inner" @_start @_end)))
(function_definition) @function.outer

;; methods
(method_declaration
  body: (compound_statement . "{" . (_) @_start @_end (_)? @_end . "}"
  (#make-range! "function.inner" @_start @_end)))
(method_declaration) @function.outer

;; classes
(class_declaration
  body: (declaration_list . "{" . (_) @_start @_end (_)? @_end . "}"
  (#make-range! "class.inner" @_start @_end)))
(class_declaration) @class.outer

;; loops
(for_statement
  (compound_statement . "{" . (_) @_start @_end (_)? @_end . "}"
  (#make-range! "loop.inner" @_start @_end)))
(for_statement) @loop.outer

(foreach_statement
  body: (compound_statement . "{" . (_) @_start @_end (_)? @_end . "}"
  (#make-range! "loop.inner" @_start @_end)))
(foreach_statement) @loop.outer

(while_statement
  body: (compound_statement . "{" . (_) @_start @_end (_)? @_end . "}"
  (#make-range! "loop.inner" @_start @_end)))
(while_statement) @loop.outer

(do_statement
  body: (compound_statement . "{" . (_) @_start @_end (_)? @_end . "}"
  (#make-range! "loop.inner" @_start @_end)))
(do_statement) @loop.outer

;; conditionals
(switch_statement
  body: (switch_block . "{" . (_) @_start @_end (_)? @_end . "}"
  (#make-range! "conditional.inner" @_start @_end)))
(switch_statement) @conditional.outer

(if_statement
  body: (compound_statement . "{" . (_) @_start @_end (_)? @_end . "}"
  (#make-range! "conditional.inner" @_start @_end)))
(if_statement) @conditional.outer

(else_clause
  body: (compound_statement . "{" . (_) @_start @_end (_)? @_end . "}"
  (#make-range! "conditional.inner" @_start @_end))
)

(else_if_clause
  body: (compound_statement . "{" . (_) @_start @_end (_)? @_end . "}"
  (#make-range! "conditional.inner" @_start @_end))
)

;; blocks
(_ (switch_block) @block.inner) @block.outer

;; parameters
(arguments
  "," @_start .
  (_) @parameter.inner
  (#make-range! "parameter.outer" @_start @parameter.inner))
(arguments
  . (_) @parameter.inner
  . ","? @_end
  (#make-range! "parameter.outer" @parameter.inner @_end))

(formal_parameters
  "," @_start .
  (_) @parameter.inner
  (#make-range! "parameter.outer" @_start @parameter.inner))
(formal_parameters
  . (_) @parameter.inner
  . ","? @_end
  (#make-range! "parameter.outer" @parameter.inner @_end))

;; comments
(comment) @comment.outer
