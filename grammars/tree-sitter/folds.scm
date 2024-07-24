;

([(with_action) (range_action)] @fold
  (#set! fold.endAt endPosition)
  (#set! fold.adjustToEndOfPreviousRow))


(if_start) @fold.start
(else_if_start) @fold.end @fold.start
(else_start) @fold.end @fold.start
(if_end) @fold.end
