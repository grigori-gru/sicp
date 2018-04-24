#lang racket/base

(require rackunit)

(define (tree-map func tree)
    (map (lambda (sub-tree)
        (if (pair? sub-tree)
            (tree-map func sub-tree)
            (func sub-tree)))
        tree))

(define (square x) (* x x))

(define (square-tree tree) (tree-map square tree))

(define tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(define expected-tree (list 1 (list 4 (list 9 16) 25) (list 36 49)))

(check-equal? (square-tree tree) expected-tree)
