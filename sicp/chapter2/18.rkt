#lang racket/base

(require rackunit)

(define (append list1 list2)
  (if (null? list1)
    list2
    (cons (car list1) (append (cdr list1) list2))))

(define (reverse l)
  (if (null? (cdr l))
    (list (car l))
    (append (reverse (cdr l)) (list (car l)))))

(check-equal? (reverse (list 1 2 3 4)) (list 4 3 2 1))
