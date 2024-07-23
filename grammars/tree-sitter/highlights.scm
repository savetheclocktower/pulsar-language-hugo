
; IDENTIFIERS
; ===========

[(field) (field_identifier)] @support.property.gotmpl

(variable) @variable.other.gotmpl

(function_call function: (_) @support.other.function.gotmpl)
(method_call
  method: (selector_expression
    field: (field_identifier) @support.other.function.method.gotmpl))

((identifier) @support.builtin.function.gotmpl
  (#match? @support.builtin.function.gotmpl "^(and|call|html|index|slice|js|len|not|or|print|printf|println|urlquery|eq|ne|lt|ge|gt|ge)$")
  (#set! capture.final))


; STRINGS
; =======

(interpreted_string_literal) @string.quoted.double.gotmpl
(interpreted_string_literal "\"" @punctuation.definition.string.begin.gotmpl
  (#is? test.first))
(interpreted_string_literal "\"" @punctuation.definition.string.end.gotmpl
  (#is? test.last))

(raw_string_literal) @string.quoted.backtick.gotmpl
((raw_string_literal) @punctuation.definition.string.begin.gotmpl
  (#match? @punctuation.definition.string.begin.gotmpl "^`")
  (#set! adjust.endAfterFirstMatchOf "^`"))
((raw_string_literal) @punctuation.definition.string.end.gotmpl
  (#match? @punctuation.definition.string.end.gotmpl "`$")
  (#set! adjust.startBeforeFirstMatchOf "`$"))

(rune_literal) @string.quoted.single.rune.gotmpl
((rune_literal) @punctuation.definition.string.begin.gotmpl
  (#match? @punctuation.definition.string.begin.gotmpl "^'")
  (#set! adjust.endAfterFirstMatchOf "^'"))
((rune_literal) @punctuation.definition.string.end.gotmpl
  (#match? @punctuation.definition.string.end.gotmpl "'$")
  (#set! adjust.startBeforeFirstMatchOf "'$"))

; NUMBERS
; =======

(int_literal) @constant.numeric.integer.gotmpl
(float_literal) @constant.numeric.float.gotmpl
(imaginary_literal) @constant.numeric.imaginary.gotmpl

; CONSTANTS
; =========

[
  (true)
  (false)
] @constant.language.boolean._TYPE_.gotmpl

(nil) @constant.language.nil.gotmpl

; KEYWORDS
; ========

[
  "else"
  "if"
  "else if"
  "range"
  "with"
  "end"
  "template"
  "define"
  "block"
] @keyword.control._TEXT_.gotmpl

":=" @keyword.operator.assignment.gotmpl
"." @keyword.operator.context.current.gotmpl

; COMMENTS
; ========

(comment) @comment.block.gotmpl
((comment) @punctuation.definition.comment.begin.gotmpl
  (#set! adjust.endAfterFirstMatchOf "^/\\*"))
((comment) @punctuation.definition.comment.begin.gotmpl
  (#set! adjust.startBeforeFirstMatchOf "\\*/$"))


; PUNCTUATION
; ===========

"{{" @punctuation.delimiter.embedded.begin.gotmpl
"}}" @punctuation.delimiter.embedded.end.gotmpl
