#lang racket/base

(require rackunit)
(require "./38.rkt")
(require racket/trace)

(define (reverse-right sequence)
  (fold-right (lambda (x y) (append y (list x))) null sequence))

(define (reverse-left sequence)
  (fold-left (lambda (x y) (cons y x)) null sequence))

(define seq (list 1 2 3 4 5 6))
(define expected-seq (reverse seq))

(check-equal? (reverse-right seq) expected-seq)
(check-equal? (reverse-left seq) expected-seq)
