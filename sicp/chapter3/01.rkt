#lang racket/base

(require rackunit)

(define (make-accumulator num)
  (let ((cur-bal num))
         (lambda (added-num)
           (begin (set! cur-bal (+ cur-bal added-num))
                  cur-bal))))

(define A (make-accumulator 5))

(check-equal? (A 10) 15)
(check-equal? (A 10) 25)
(check-equal? (A 30) 55)
