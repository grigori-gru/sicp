#lang racket/base

(define (for-each f l)
	(cond ((null? l) #t)
		(else (f (car l))
				  (for-each f (cdr l)))))

(provide for-each)