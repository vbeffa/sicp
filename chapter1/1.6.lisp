;;;;;;;;;;;;;;;;
; Exercise 1.6 ;
;;;;;;;;;;;;;;;;

; Alyssa P. Hacker doesn't see why if needs to be provided as a special form.
; "Why can't I just deinfe it as an ordinary procedure in terms of cond?" she asks.
; Alyssa's friend Eva Lu Ator claims this can indeed be done, and she deines a
; new version of if:

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

; Eva demonstrates the program for Alyssa:

(new-if (= 2 3) 0 5)
; 5

(new-if (= 1 1) 0 5)
; 0

; Delighted, Alyssa uses new-if to rewrite the square-root program:

(define (sqrt-iter guess x)
    (new-if (good-enough? guess x)
	    guess
	    (sqrt-iter (improve guess x)
		       x)))

; What happens when Alyssa attempts to use this to compute square roots? Explain.

; This leads to infinite recursion. Because Lisp uses applicative-order evaluation,
; when new-if is called all three of its arguments are evaluated. The third argu-
; ment to new-if in sqrt-iter, (sqrt-iter (improve guess x) x), must be evaluated
; before new-if is applied, and this leads to another call to sqrt-iter, which
; leads to another call to new-if, and so on.

; In general, this new-if procedure will only work with arguments that do not
; make (or lead to) recursive calls of the procedure that calls new-if. If they do,
; infinite recursion will occur.
