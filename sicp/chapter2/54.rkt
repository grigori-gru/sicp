#lang racket/base

(require rackunit)
(require "../lib.rkt")
(require "./40-1.rkt")
(require racket/trace)
(require math/number-theory)

(define (memq item x)
  (cond ((null? x) #f)
    ((eq? item (car x)) x)
    (else (memq item (cdr x)))))

(define (equal? x y)
  (cond ((and (null? x) (null? y)) #t)
        ((and (list? x) (list? y))
          (and (equal? (car x) (car y)) (equal? (cdr x) (cdr y))))
        (else (eq? x y))))


(define res1 (memq `apple `(pear banana prune)))
(define res2 (memq `apple `(x (apple sauce) y apple pear)))

; (trace equal?)
(check-equal? res1 #f)
(check-equal? res2 `(apple pear))

(check-equal? (equal? `(this is a list) `(this is a list)) #t)
(check-equal? (equal? `(this is a list) `(this (is a) list)) #f)
