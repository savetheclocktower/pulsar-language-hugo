
"if" @indent
("else" @dedent
  (#set! indent.force true))
"else" @indent
("else if" @dedent
  (#set! indent.force true))
"else if" @indent

[
  "range"
  "with"
  "define"
  "block"
] @indent

("end" @dedent
  (#set! indent.force true))
