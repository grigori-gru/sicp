#lang racket/base

(require rackunit)

(define (exp x level)
    (if (= level 0)
        1
        (* x (exp x (- level 1)))
    )
)

(define (inc x)
    (+ x 1))

(define (double func)
    (lambda (x) (func (func x))))
; (define (average x y)
;     (/ (+ x y) 2))

; (define (average-damp f)
;     (lambda (x) (average x (f x))))

(check-equal? (exp 2 4) 16)

(check-equal? ((double inc) 1) 3)

(check-equal? (((double (double double)) inc) 5) 21)
