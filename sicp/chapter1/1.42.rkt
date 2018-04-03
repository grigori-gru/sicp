#lang racket/base

(require rackunit)

(define (inc x)
    (+ x 1))

(define (square x)
    (* x x))

(define (compose f1 f2)
    (lambda (x) (f1 (f2 x))))

(check-equal? ((compose square inc) 6) 49)
