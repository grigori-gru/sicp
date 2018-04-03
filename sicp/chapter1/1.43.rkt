#lang racket/base

(require rackunit)
(require racket/trace)

(define (square x)
    (* x x))

(define (repeated func num)
    (if (= num 1)
        (lambda (x) (func x))
        (repeated (lambda (x) (func (func x))) (- num 1))
    ))

(trace repeated)
(check-equal? ((repeated square 2) 5) 625)
