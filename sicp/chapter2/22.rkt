#lang racket/base

(require rackunit)

(define (square x)
  (* x x))

(define (square-list items)
	(define (iter things answer)
		(if (null? things)
			(reverse answer)
			(iter (cdr things)
						(cons (square (car things))
									answer))))
	(iter items null))

(check-equal? (square-list (list 1 2 3 4)) (list 1 4 9 16))
