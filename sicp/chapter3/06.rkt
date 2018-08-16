#lang racket/base

(require rackunit)

(define rand
  (let ((base 111))
    (define generate (random base))
    (define (reset new-x)
      (begin (set! base new-x)
             (print "Random num is reset")
             (generate)))
    (define (dispatch m)
      (cond ((eq? m 'reset) reset)
            ((eq? m 'generate) generate)
            (else (error "Неизвестный вызов -- MAKE-ACCOUNT"
                        m))))
  dispatch))

(rand 'generate)
(rand 'reset)
