#lang racket/base

(require rackunit)

(define (deep-reverse tree)
	(cond ((null? tree) null)
				((pair? (car tree))
					(append (deep-reverse (cdr tree))
										(list (deep-reverse (car tree)))))
				(else (append (deep-reverse (cdr tree))
											(list (car tree))))))

(define tree (list (list 1 2) (list 3 4)))
(define expected-reverse (list (list 3 4) (list 1 2)))
(define expected-deep-reverse (list (list 4 3) (list 2 1)))

(check-equal? (reverse tree) expected-reverse)
(check-equal? (deep-reverse (list 1)) (list 1))
(check-equal? (deep-reverse (list 1 2)) (list 2 1))
(check-equal? (deep-reverse (list 1 2 3)) (list 3 2 1))
(check-equal? (deep-reverse (list 1 2 3 4)) (list 4 3 2 1))
(check-equal? (deep-reverse (list (list 1 2))) (list (list 2 1)))

(check-equal? (deep-reverse tree) expected-deep-reverse)
