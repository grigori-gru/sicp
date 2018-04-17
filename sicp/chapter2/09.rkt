#lang racket/base

(require rackunit)
(require "07.rkt")

(define (radius interval)
    (/ (- (upper-bound interval)
          (lower-bound interval))
       2))


(check-equal? (radius (make-interval 10 20)) 5)

(provide radius)
