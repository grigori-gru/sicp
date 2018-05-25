#lang racket/base

(require rackunit)
(require "../lib.rkt")
(require racket/trace)

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (remove item sequence)
  (filter (lambda (x) (not (= x item)))
          sequence))

(define (permutations s)
  (if (null? s)
    (list null)
    (flatmap (lambda (x)
               (map (lambda (p) (cons x p))
                    (permutations (remove x s))))
              s)))

(define seq (list 1 2 3))

(check-equal? (permutations seq) (list seq (list 1 3 2) (list 2 1 3) (list 2 3 1) (list 3 1 2) (list 3 2 1)))

(provide flatmap)
