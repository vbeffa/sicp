;;;;;;;;;;;;;;;;
; Exercise 1.7 ;
;;;;;;;;;;;;;;;;

; The good-enough? test used in computing square roots will not be very effec-
; tive for finding the square roots of very small numbers. Also, in real computers,
; arithmetic operations are almost always performed with limited precision. This
; makes our test inadequate for very large numbers. Explain these statements, with
; examples showing how the test fails for small and large numbers. An alternative
; strategy for implementing good-enough? is to watch how guess changes from
; one iteration to the next and to stop when the change is a very small fraction of
; the guess. Design a square-root procedure that uses this kind of end test. Does
; this work better for small and large numbers?

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
