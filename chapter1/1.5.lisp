;;;;;;;;;;;;;;;;
; Exercise 1.5 ;
;;;;;;;;;;;;;;;;

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
    y))

(test 0 (p))

; With an interpreter that uses applicative-order evaluation, the last expression will
; result in an infinite loop, as both arguments to the procedure test, 0 and (p), will
; be reduced. The application of p will result in an infinite loop.
; With an interpreter that uses normal-order evaluation, the last expression will reduce
; to 0. The if special form only evaluates the predicate (= 0 0) and consequent (0) in
; this case, not the alternative (p), so the infinite loop is avoided.

(test 0 (p))

(if (= 0 0)
    0
  (p))

0
