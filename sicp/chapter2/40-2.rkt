#lang racket/base

(require rackunit)
(require "../lib.rkt")
(require "./40-1.rkt")
(require racket/trace)
(require math/number-theory)

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (flatmap
                  (lambda (i)
                    (map (lambda (j) (list i j))
                         (enumerate-interval 1 (- i 1))))
               (enumerate-interval 1 n)))))

(define (unique-pairs n)
  (filter prime-sum?
          (flatmap
            (lambda (i)
              (map (lambda (j) (list i j))
                   (enumerate-interval 1 (- i 1))))
            (enumerate-interval 1 n))))

(define (prime-sum-pairs-2 n)
  (map make-pair-sum (unique-pairs n)))

(define expected-result (prime-sum-pairs 6))
(define result (prime-sum-pairs-2 6))

(check-equal? result expected-result)

(provide make-pair-sum prime-sum-pairs unique-pairs)
