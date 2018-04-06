#lang racket/base

(require rackunit)

(define (cons x y)
    (* (expt car-base x)
       (expt cdr-base y)))

(define (iter num)
    (lambda (div) (if (= (remainder num div) 0)
        (+ 1 ((iter (/ num div)) div))
        0)))

(define (car num)
    ((iter num) car-base))

(define (cdr num)
    ((iter num) cdr-base))

(define car-base 2)
(define cdr-base 3)

(define test-cons (cons 4 3))
(define test-cons-null (cons 0 3))

(check-equal? test-cons 432)
(check-equal? (car test-cons) 4)
(check-equal? (cdr test-cons) 3)

(check-equal? test-cons-null 27)
(check-equal? (car test-cons-null) 0)
(check-equal? (cdr test-cons-null) 3)
