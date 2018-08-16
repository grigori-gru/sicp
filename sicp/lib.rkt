#lang racket/base

; (require racket/trace)

(provide (all-defined-out))

(define (print-rat x)
    (newline)
    (display (numer x))
    (display "/")
    (display (denom x))
    (newline)
)

(define (avg a b)
    (/ (+ a b) 2))

(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (square x)
    (* x x))

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
    (if (> low high)
        null
        (cons low (enumerate-interval (+ low 1) high))))

; working with binary tree
(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
    (list entry left right))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (entry set)) true)
        ((< x (entry set))
          (element-of-set? x (left-branch set)))
        ((> x (entry set))
          (element-of-set? x (right-branch set)))))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x ’() ’()))
				((= x (entry set)) set)
				((< x (entry set))
				 (make-tree (entry set)
										(adjoin-set x (left-branch set))
										(right-branch set)))
				((> x (entry set))
				 (make-tree (entry set)
										(left-branch set)
										(adjoin-set x (right-branch set))))))
