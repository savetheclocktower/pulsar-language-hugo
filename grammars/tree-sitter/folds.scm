;

([(with_action) (range_action)] @fold
  (#set! fold.endAt endPosition)
  (#set! fold.adjustToEndOfPreviousRow))


(if_action "if" @fold.start)
("else if" @fold.end @fold.start
  ; TODO: This needs an enhancement that should make it into 1.120. Until then,
  ; the fold won't be quite right in a series of `else if`s or `elses` becase
  ; we can't target the `{{` at the start of the row.
  (#set! fold.adjustToEndOfPreviousRow))
("else" @fold.end @fold.start
  (#set! fold.adjustToEndOfPreviousRow))
((if_action "{{" @fold.end)
  (#is? test.lastOfType))
