#lang racket/base

(require rackunit)
(require "../lib.rkt")
(require racket/trace)

(define (accumulate-n op initial seqs)
  (if (null? (car seqs))
    null
    (cons (accumulate op initial (map (lambda (x) (car x)) seqs))
          (accumulate-n op initial (map (lambda (x) (cdr x)) seqs)))))

(define tree (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

(trace accumulate-n)
(check-equal? (accumulate-n + 0 tree) (list 22 26 30))
