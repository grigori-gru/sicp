#lang racket/base

(require rackunit)

(define (cons x y)
    (lambda (m) (m x y)))

(define (cdr z)
    (z (lambda (p q) q)))

(define (car z)
    (z (lambda (p q) p)))

(check-equal? (cdr (cons "x" "y")) "y")
(check-equal? (car (cons "x" "y")) "x")
