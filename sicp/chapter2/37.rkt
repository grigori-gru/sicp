#lang racket/base

(require rackunit)
(require "../lib.rkt")
(require "./36.rkt")
(require racket/trace)

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

(define (transpose mat)
  (accumulate-n cons null mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
  (map (lambda (x) (matrix-*-vector cols x)) m)))

(define seq1 (list 1 2 3))
(define seq2 (list 4 5 6))
(define vector (list 7 8 9))

(define matrix (list seq1 seq2))

(check-equal? (dot-product seq1 seq2) 32)
(check-equal? (matrix-*-vector matrix vector) (list 50 122))
(check-equal? (transpose (list seq1 seq2 vector)) (list (list 1 4 7) (list 2 5 8) (list 3 6 9)))
(check-equal? (matrix-*-matrix (list (list 10 11) (list 12 13) (list 14 15))
                               (list (list 1 2 3) (list 4 5 6)))
              (list (list 54 75 96) (list 64 89 114) (list 74 103 132)))