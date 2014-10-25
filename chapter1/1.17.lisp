;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Ex. 1.17. Recursive multiplication function using add, double, and halve that ;
; uses a logarithmic number of steps.                                           ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (fast-mult a b)
    (cond ((= a 1) b)
	  ((even? a) (fast-mult (halve a) (double b)))
	  (else (+ b (fast-mult (halve (- a 1)) (double b))))))

(define (double a) (+ a a))

(define (halve a) (/ a 2))
