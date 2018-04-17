#lang racket/base

(require rackunit)

(define (same-parity d . l)
  (define (iter item)
    (if (null? item)
      null
      (if (= (remainder d 2)
             (remainder (car item) 2))
        (cons (car item) (iter (cdr item)))
        (iter (cdr item)))))
  (cons d (iter l)))

(check-equal? (same-parity 1 2 3 4 5 6 7) (list 1 3 5 7))
(check-equal? (same-parity 2 3 4 5 6 7) (list 2 4 6))
