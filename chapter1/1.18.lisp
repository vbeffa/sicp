;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Ex. 1.18. Iterative multiplication function using add, double, and halve.     ;
; Takes a logarithmic number of steps.                                          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (fast-mult a b)
    (define (fast-mult-iter a b acc)
	(if (or (= a 0) (= a 1))
	    (+ b acc)
	    (fast-mult-iter (halve (if (even? a) a (- a 1)))
			    (double b)
			    (+ (if (even? a) 0 b) acc))))
  (fast-mult-iter a b 0))

(define (double a) (+ a a))

(define (halve a) (/ a 2))
