;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 1.1.7 Example: Square Roots by Newton's Method ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; sqrt-iter procedure
(define (sqrt-iter guess x)
    (if (good-enough? guess x)
	guess
	(sqrt-iter (improve guess x)
		   x)))

; improve procedure
(define (improve guess x)
    (average guess (/ x guess)))

; average procedure
(define (average x y)
    (/ (+ x y) 2))

; good-enough procedure
(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))

; sqrt procedure
; start with 1.0 as the guess to force decimals instead of rational numbers
(define (sqrt x)
    (sqrt-iter 1.0 x))

; encapsulated version with subprocedures
(define (sqrt x)
    (define (good-enough? guess)
	(< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
      (average guess (/ x guess)))
  (define (sqrt-iter guess)
      (if (good-enough? guess)
	  guess
	  (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))
