#lang racket/base

(require rackunit)
(require "../lib.rkt")

(define (make-rat n d)
    (let ((g
        (if (< n 0)
            (* -1 (gcd n d))
            (gcd n d)
        )))
        (cons (/ n g) (/ d g))))

(define (add-rat x y)
    (make-rat (+ (* (numer x) (denom y))
                 (* (numer y) (denom x)))
    (* (denom x) (denom y))))

(define (mul-rat x y)
    (make-rat (* (numer x) (numer y))
               (* (denom x) (denom y)))
)

(define one-half (make-rat 1 2))
(define one-third (make-rat 1 3))
(define sub-one-five (make-rat -1 5))

(print-rat sub-one-five)

(check-equal? one-half '(1 . 2))
(check-equal? (add-rat one-half one-third) '(5 . 6))
(check-equal? (mul-rat one-half one-third) '(1 . 6))
(check-equal? (mul-rat sub-one-five one-third) '(-1 . 15))
