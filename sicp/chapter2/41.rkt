#lang racket/base

(require rackunit)
(require "../lib.rkt")
(require "./40-2.rkt")
(require racket/trace)
(require math/number-theory)

(define (sum-pair pair)
  (+ (car pair) (cadr pair)))

(define (pair-equal? n)
  (lambda (pair) (= (sum-pair pair) n)))

(define (prime-sum-pairs-equal n s)
  (map make-pair-sum
       (filter (pair-equal? s)
               (unique-pairs n))))

(define expected-result (list (list 4 3 7) (list 5 2 7) (list 6 1 7)))
(define result (prime-sum-pairs-equal 6 7))

(check-equal? (sum-pair (list 2 4)) 6)
(check-equal? ((pair-equal? 6) (list 2 4)) #t)
(check-equal? result expected-result)
