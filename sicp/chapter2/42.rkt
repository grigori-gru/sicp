; #lang racket/base

; (require rackunit)
; (require "../lib.rkt")
; (require "./40-1.rkt")
; (require racket/trace)
; (require math/number-theory)

; (define (adjoin-position new-row board-size rest-of-queens)
;   )

; (define (safe? k positions)
;   )

; (define empty-board
;   (list null))

; (define (each-adjoin board-size k)
;   (lambda (rest-of-queens)
;     (map (lambda (new-row)
;            (adjoin-position new-row k rest-of-queens))
;          (enumerate-interval 1 board-size))))

; (define (queens board-size)
;   (define (queen-cols k)
;     (if (= k 0)
;       (list empty-board)
;       (filter
;         (lambda (positions) (safe? k positions))
;         (flatmap (func board-size k)
;                  (queen-cols (- k 1))))))
;   (queen-cols board-size))

; (define expected-result (prime-sum-pairs 6))
; (define result (prime-sum-pairs-2 6))

; (check-equal? result expected-result)
