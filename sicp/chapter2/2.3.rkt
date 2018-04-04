#lang racket/base

(require rackunit)
(require "2.2.rkt")

(define (make-rectangle left-down right-up) (cons left-down right-up))

(define (get-left-down rectangle) (car rectangle))
(define (get-right-up rectangle) (cdr rectangle))

(define (width rectangle)
    (+ (abs (x-point (get-left-down rectangle)))
       (abs (x-point (get-right-up rectangle)))))

(define (height rectangle)
    (+ (abs (y-point (get-left-down rectangle)))
       (abs (y-point (get-right-up rectangle))))
)
(define (get-rectangle-perimeter rectangle)
    (* (+ (width rectangle)
          (height rectangle))
       2))

(define (get-rectangle-square rectangle)
    (* (width rectangle)
       (height rectangle)))

; test data
(define left-down-test (make-point -2 2))
(define right-up-test (make-point 7 -9))
(define test-rectangle (make-rectangle left-down-test right-up-test))

(check-equal? (get-left-down test-rectangle) (make-point -2 2))
(check-equal? (width test-rectangle) 9)
(check-equal? (height test-rectangle) 11)
(check-equal? (get-rectangle-perimeter test-rectangle) 40)
(check-equal? (get-rectangle-square test-rectangle) 99)
