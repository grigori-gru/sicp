#lang racket/base

(require rackunit)

(define (last-pair l)
    (if (null? (cdr l))
        l
        (last-pair (cdr l))))


(check-equal? (last-pair (list 1 2 3 4)) (list 4))
