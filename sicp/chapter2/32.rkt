#lang racket/base

(require rackunit)
(require racket/trace)

(define (subsets s)
	(if (null? s)
		(list null)
		(let ((rest (subsets (cdr s))))
			(append rest (map (lambda (x) (cons (car s) x)) rest)))))

(define tree (list 1 2 3))
(define expected-tree (list null (list 3) (list 2) (list 2 3) (list 1) (list 1 3) (list 1 2) (list 1 2 3)))

(trace subsets)
(check-equal? (subsets tree) expected-tree)
