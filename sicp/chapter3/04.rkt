#lang racket/base

(require rackunit)

(define (call-the-cops) "Help!")

(define (make-account balance password)
  (let ((calls 0))
    (define (withdraw amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                balance)
          "Недостаточно денег на счете"))
    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)
    (define (dispatch input-password m)
      (cond ((not (eq? input-password password))
              (lambda (x)
                (set! calls (+ calls 1))
                (if (eq? calls 7)
                    (call-the-cops)
                    "Неверный пароль")))
            ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            (else (error "Неизвестный вызов -- MAKE-ACCOUNT"
                        m))))
    dispatch))

(define acc (make-account 100 'secret-password))

(check-equal? ((acc 'secret-password 'withdraw) 40) 60)

(check-equal? ((acc 'not-secret-password 'withdraw) 40) "Неверный пароль")
(check-equal? ((acc 'not-secret-password 'withdraw) 40) "Неверный пароль")

(check-equal? ((acc 'not-secret-password 'withdraw) 40) "Неверный пароль")
(check-equal? ((acc 'not-secret-password 'withdraw) 40) "Неверный пароль")

(check-equal? ((acc 'not-secret-password 'withdraw) 40) "Неверный пароль")
(check-equal? ((acc 'not-secret-password 'withdraw) 40) "Неверный пароль")

(check-equal? ((acc 'not-secret-password 'withdraw) 40) (call-the-cops))
