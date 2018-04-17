#lang racket/base

(require rackunit)
(require "07.rkt")

(define (sub-interval x y)
    (make-interval (- (lower-bound x) (lower-bound y))
                   (- (upper-bound x) (upper-bound y))))

(define interval1 (make-interval 10 20))
(define interval2 (make-interval 11 22))

(check-equal? (sub-interval interval2 interval1) (make-interval 1 2))
