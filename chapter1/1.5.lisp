;;;;;;;;;;;;;;;;
; Exercise 1.5 ;
;;;;;;;;;;;;;;;;

; Ben Bitdiddle has invented a test to determine whether the interpreter he is faced
; with is using applicative-order evaluation or normal-order evaluation. He defines
; the following two procedures:

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
    y))

; Then he evaluates the expression

(test 0 (p))

; What behavior will Ben observe with an interpreter that uses applicative-order
; evaluation? What behavior will he observe with an interpreter that uses normal-
; order evaluation?

; With an interpreter that uses applicative-order evaluation, the last expression
; will result in infinite recursion. Since both arguments to the procedure test,
; 0 and (p), are reduced (evaluated), the application (reduction) of p results in
; infinite recursion.

; With an interpreter that uses normal-order evaluation, the if expression will
; reduce (evaluate) to 0. The if special form only evaluates the predicate (= 0 0)
; and consequent (0), not the alternative (p), so the infinite loop is avoided.

(test 0 (p))

(if (= 0 0)
    0
  (p))

0
