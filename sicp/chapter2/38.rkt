#lang racket/base

(require rackunit)
(require "../lib.rkt")
(require racket/trace)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest))
        (cdr rest))))
    (iter initial sequence))

(define fold-right accumulate)

(define seq (list 1 2 3))

(check-equal? (fold-left / 1 seq) (/ 1 6))
(check-equal? (fold-right / 1 seq) (/ 3 2))
(check-equal? (fold-left list null seq) (list (list (list null 1) 2) 3))
(check-equal? (fold-right list null seq) (list 1 (list 2 (list 3 null))))

(provide fold-right fold-left)
