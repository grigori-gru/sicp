#lang racket/base

(require rackunit)
(require "../lib.rkt")

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) null sequence))

(define (append seq1 seq2)
  (accumulate cons seq1 seq2))

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

(define tree (list 1 2 3))

(check-equal? (map square tree) (list 1 4 9))
(check-equal? (map square tree) (list 1 4 9))
(check-equal? (append tree tree) (list 1 2 3 1 2 3))
(check-equal? (length tree) 3)
