;;;;;;;;;;;;;;;;
; Exercise 1.6 ;
;;;;;;;;;;;;;;;;

; new-if procedure
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))
