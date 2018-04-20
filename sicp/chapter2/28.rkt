#lang racket/base

(require rackunit)

(define (fringe tree)
	(cond ((null? tree) null)
				((pair? (car tree))
					(append (fringe (car tree))
									(fringe (cdr tree))))
				(else
					(append (list (car tree))
					 				(fringe (cdr tree))))))

(define tree (list (list 1 2) (list 3 4)))

(check-equal? (fringe (list 1)) (list 1))
(check-equal? (fringe (list (list 1 2))) (list 1 2))
(check-equal? (fringe tree) (list 1 2 3 4))
(check-equal? (fringe (list 1 2 tree)) (list 1 2 1 2 3 4))
