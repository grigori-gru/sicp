#lang racket/base

(provide (all-defined-out))

(define (print-rat x)
    (newline)
    (display (numer x))
    (display "/")
    (display (denom x))
    (newline)
)

(define (avg a b)
    (/ (+ a b) 2))

(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))

(define (numer x) (car x))
(define (denom x) (cdr x))
