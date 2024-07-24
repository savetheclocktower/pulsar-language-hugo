
(if_start) @indent
(else_start) @dedent @indent
(else_if_start) @dedent @indent

[
  "range"
  "with"
  "define"
  "block"
] @indent

([
  (if_end)
  (with_end)
  (range_end)
  (block_end)
  (define_end)
] @match
  (#set! indent.matchIndentOf parent.firstChild.startPosition)
)
