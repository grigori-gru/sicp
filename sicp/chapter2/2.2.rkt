#lang racket/base

(require rackunit)
(require "../lib.rkt")

(define (make-point x y)
    (cons x y))

(define (x-point point)
    (car point))

(define (y-point point)
    (cdr point))

(define (start-segment segment)
    (car segment))

(define (end-segment segment)
    (cdr segment))

(define (make-segment start end)
    (cons start end))

(define (getСoord coord)
    (lambda (segment) (avg (coord (start-segment segment)) (coord (end-segment segment)))))

(define (midpoint-segment segment)
    (make-point ((getСoord x-point) segment) ((getСoord y-point) segment)))

(define testSegment
    (make-segment (make-point 1 2) (make-point -5 10)))

(define testPoint (make-point 1 2))

(check-equal? testPoint '(1 . 2))
(check-equal? testSegment '(1 . 2) -5 . 10)
(check-equal? (end-segment testSegment) (make-point -5 10))
(check-equal? (midpoint-segment testSegment) (make-point -2 6))

(provide make-point make-segment midpoint-segment x-point y-point)