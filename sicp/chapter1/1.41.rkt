#lang racket/base

(require rackunit)

(define (inc x)
    (+ x 1))

(define (double func)
    (lambda (x) (func (func x))))

(check-equal? ((double inc) 1) 3)

(check-equal? (((double (double double)) inc) 5) 21)
