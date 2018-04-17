#lang racket/base

(require rackunit)

(define (square-list items)
  (if (null? items)
    null
    (cons (expt (car items) 2) (square-list (cdr items)))))

(define (square-list-map items)
  (map (lambda (x) (* x x)) items))

(check-equal? (square-list (list 1 2 3 4)) (list 1 4 9 16))
(check-equal? (square-list-map (list 1 2 3 4)) (list 1 4 9 16))
