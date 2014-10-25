;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Ex. 1.16. Iterative implementation of square function that uses a logarithmic ;
; number of steps.                                                              ;
;                                                                               ;
; expt indicates the exponent that b is raised to in the current iteration when ;
; we square a, and thus the amount to be subtracted from n in order to keep the ;
; quantity a * b^n invariant throughout the process.                            ;
;                                                                               ;
; Sample inputs and process evolution                                           ;
; -----------------------------------                                           ;
;   2^10 = 1024         2^12 = 4096          3^7 = 2187                         ;
;    a  b  n expt        a  b  n expt        a  b  n expt                       ;
; ---- -- -- ----     ---- -- -- ----     ---- -- -- ----                       ;
;    1  2 10    1        1  2 12    1        1  3  7    1                       ;
;    2  2  9    1        2  2 11    1        3  3  6    1                       ;
;    4  2  8    2        4  2 10    2        9  3  5    2                       ;
;   16  2  6    4       16  2  8    4       81  3  3    4                       ;
;  256  2  2    8      256  2  4    8      243  3  2    4                       ;
;  512  2  1    8      512  2  3    8      729  3  1    4                       ;
; 1024  2  0    8     1024  2  2    8     2187  3  0    4                       ;
;                     2048  2  1    8                                           ;
;                     4096  2  0    8                                           ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (fast-expt b n)
    (define (fast-expt-iter a b n expt)
	(if (= n 0)
	    a
	    (fast-expt-iter (if (or (= a 1) (<= n expt)) (* a b) (square a))
			    b
			    (if (<= n expt) (- n 1) (- n expt))
			    (cond ((< a b) 1)
				  ((= a b) 2)
				  ((<= n expt) expt)
				  (else (* 2 expt))))))
  (fast-expt-iter 1 b n 1))

;    a  b  n expt   a  b  n expt
; ---- -- -- ----  -- -- -- ----
;    1  2 10    0   1  2  1    0
;    2  2  9    1   2  2  0    1
;    4  2  8    2
;   16  2  6    4
;  256  2  2    8
;  512  2  1    8
; 1024  2  0    8

(define (fast-expt2 b n)
    (define (fast-expt-iter a b n expt)
	(if (= n 0)
	    a
	    (fast-expt-iter (if (or (= a 1) (<= n expt)) (* a b) (square a))
			    b
			    (if (or (= expt 0) (<= n expt)) (- n 1) (- n expt))
			    (cond ((= expt 0) 1)
				  ((<= n expt) expt)
				  (else (* 2 expt))))))
  (fast-expt-iter 1 b n 0))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Using only 3 parameters, where expt = n - m and n <= expt <=> m <= n / 2:
;
;    a  b  m expt (n - m)  m <= expt <=> m <= n / 2     a  b  m
; ---- -- -- ------------  ------------------------    -- -- --
;    1  2 10            0  false                        1  2  1
;    2  2  9            1  false                        
;    4  2  8            2  false
;   16  2  6            4  false
;  256  2  2            8  true
;  512  2  1            9  true
; 1024  2  0           10  true
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (fast-expt3 b n)
    (define (fast-expt-iter a b m)
	(if (= m 0)
	    a
	    (fast-expt-iter (if (or (= a 1) (<= m (/ n 2)))
				(* a b)
				(square a))
			    b
			    (if (or (= m n) (<= m (/ n 2)))
				(- m 1)
				(- (* 2 m) n)))))
  (fast-expt-iter 1 b n))
