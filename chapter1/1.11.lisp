;;;;;;;;;;;;;;;;;
; Exercise 1.11 ;
;;;;;;;;;;;;;;;;;

(define (f n)
  (define (f-iter a b c count)
    (if (= count 1)
	c
      (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))
  (f-iter 3 2 1 n))
