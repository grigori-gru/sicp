#lang racket/base

(require rackunit)

(define (no-more? coins)
  (null? coins))

(define (first-denomination coin-values)
  (car coin-values))

(define (except-first-denomination coin-values)
  (cdr coin-values))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
          (+ (cc amount
                 (except-first-denomination coin-values))
             (cc (- amount
                    (first-denomination coin-values))
                 coin-values)))))

(define us-coins (list 50 25 10 5 1))

(check-equal? (no-more? (cdr (list 1))) #t)
(check-equal? (cc 100 us-coins) 292)
