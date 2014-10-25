(define (pascal x y)
    (cond ((= y 1) 1)
	  ((= x y) 1)
	  (else (+ (pascal (- x 1) (- y 1))
		   (pascal (- x 1) y)))))

(define (pascal x y)
    (if (or (= y 1) (= x y))
	1
	(+ (pascal (- x 1) (- y 1))
	   (pascal (- x 1) y))))
