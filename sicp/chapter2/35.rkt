#lang racket/base

(require rackunit)
(require "../lib.rkt")
(require racket/trace)

(define (func t)
  (if (not (pair? t))
    1
    (count-leaves t)))

(define (count-leaves t)
  (accumulate + 0 (map func t)))

(define sub-tree (cons (list 1 2) (list 3 4)))
(define tree (list sub-tree sub-tree))

(trace count-leaves)
(check-equal? (count-leaves tree) 8)
