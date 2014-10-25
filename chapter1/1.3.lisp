;;;;;;;;;;;;;;;;
; Exercise 1.3 ;
;;;;;;;;;;;;;;;;
; Define a procedure that takes three numbers as arguments and returns the sum
; of the squares of the two larger numbers.

(define (max a b)
  (if (> a b) a
    b))

(define (sum-of-squares a b)
  (+ (* a a) (* b b)))

(define (sum-of-squares-two-larger a b c)
  (if (> a b) (sum-of-squares a (max b c))
    (sum-of-squares b (max a c))))
