#lang racket/base

; (require racket/trace)

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

(define (square x)
    (* x x))

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
    (if (> low high)
        null
        (cons low (enumerate-interval (+ low 1) high))))
