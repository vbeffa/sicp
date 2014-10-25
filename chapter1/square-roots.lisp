; 1.1.7 Square Roots by Newton's Method

; average procedure
(define (average x y)
  (/ (+ x y) 2))

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

(define (sqrt2 x)
  (define (good-enough? guess old-guess)
    (< (abs (- guess old-guess)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess old-guess)
    (if (good-enough? guess old-guess)
	guess
      (sqrt-iter (improve guess) guess)))
  (sqrt-iter 1.0 x))

; new-if procedure
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))
