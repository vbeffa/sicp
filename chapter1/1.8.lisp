;;;;;;;;;;;;;;;;
; Exercise 1.8 ;
;;;;;;;;;;;;;;;;

; Newton's method for cube roots is based on the fact that if y is an approximation
; to the cube root of x, then a better approximation is given by the value
;
; x/y^2 + 2y
; ----------
;     3
;
; Use this formula to implement a cube-root procedure analogous to the square-
; root procedure.

; cube procedure
(define (cube x) (* (* x x) x))

; cube-root procedure
; start with 1.0 as the guess to force decimals instead of rational numbers
(define (cube-root x)
    (define (good-enough? guess old-guess)
;	(< (abs (- (cube guess) x)) 0.001))
	(< (abs (- guess old-guess)) 0.001))
  (define (cube-root-iter guess old-guess)
      (if (good-enough? guess old-guess)
	  guess
	  (cube-root-iter (improve guess) guess)))
  (define (improve guess)
      (/ (+ (/ x (square guess)) (* 2 guess)) 3))
  (cube-root-iter 1.0 x))
