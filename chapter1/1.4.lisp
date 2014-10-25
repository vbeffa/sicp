;;;;;;;;;;;;;;;;
; Exercise 1.4 ;
;;;;;;;;;;;;;;;;
; Observe that our model of evaluation allows for combinations whose operators
; are compound expressions. Use this observation to describe the behavior of the
; following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; The result of the if test is not a value but an operator, + or -.
; If b is positive, the + operator is applied to a and b: a + b.
; If b is negative, the - operator is applied to a and b: a - -b.
; In both cases the result is adding the absolute value of b to a.
