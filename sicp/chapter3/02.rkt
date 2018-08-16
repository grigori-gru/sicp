#lang racket/base

(require rackunit)

(define (make-monitored f)
  (let ((call 0))
    (lambda (arg)
      (if (eq? arg 'how-many-calls?)
        call
        (begin (set! call (+ call 1))
              (f arg))))))


(define s (make-monitored sqrt))

; (check-equal? (sqrt 100) 10)
(check-equal? (s 'how-many-calls?) 0)
(s 100)
(check-equal? (s 'how-many-calls?) 1)
