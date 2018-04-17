#lang racket/base

(require rackunit)

(define (make-interval x y) (cons x y))

(define (upper-bound interval)
    (max (car interval) (cdr interval)))

(define (lower-bound interval)
    (min (car interval) (cdr interval)))

(define interval (make-interval 5 10))

(check-equal? (upper-bound interval) 10)
(check-equal? (lower-bound interval) 5)

(provide upper-bound lower-bound make-interval)
