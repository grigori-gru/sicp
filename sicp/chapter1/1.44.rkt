#lang racket/base

(require rackunit)
(require racket/trace)

(define dx 0.00001)

(define (avgDx func)
    (lambda (x) (/
        (+
            (- (func x) dx)
            (func x)
            (+ (func x) dx)
        )
        3
    ))
)

(define (square x)
    (* x x))

(define (repeated func num)
    (if (= num 1)
        (lambda (x) (func x))
        (repeated (lambda (x) (func (func x))) (- num 1))
    ))

(define (smooth func level)
    repeated((avgDx func) level)
)

(trace repeated)
(check-equal? ((repeated square 2) 5) 625)
