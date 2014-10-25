;;;;;;;;;;;;;;;;
; Exercise 1.1 ;
;;;;;;;;;;;;;;;;

10
; 10

(+ 5 3 4)
; 12

(- 9 1)
; 8

(/ 6 2)
; 3

(+ (* 2 4) (- 4 6))
; 6

(define a 3)
;

(define b (+ a 1))
;

(+ a b (* a b))
; 19

(= a b)
; false

(if (and (> b a) (< b (* a b)))
    b
  a)
; 4

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
; 16

(+ 2 (if (> b a) b a))
; 6

(* (cond ((> a b) a)
	 ((< a b) b)
	 (else -1))
   (+ a 1))
; 16

;;;;;;;;;;;;;;;;
; Exercise 1.2 ;
;;;;;;;;;;;;;;;;

(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))

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

;;;;;;;;;;;;;;;;;
; Exercise 1.11 ;
;;;;;;;;;;;;;;;;;

(define (f n)
  (define (f-iter a b c count)
    (if (= count 1)
	c
      (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))
  (f-iter 3 2 1 n))
