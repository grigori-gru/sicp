#lang racket/base

(require rackunit)

(define (make-account balance password)
  (let ((password-list (list password)))
    (define (add new-password)
      (set! password-list (cons new-password password-list))
      password-list)
    (define (withdraw amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                balance)
          "Недостаточно денег на счете"))
    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)
    (define (dispatch input-password m)
      (cond ((not (member input-password password-list))
              (lambda (x) "Неверный пароль"))
            ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            ((eq? m 'add) add)
            (else (error "Неизвестный вызов -- MAKE-ACCOUNT"
                        m))))
    dispatch))

(define (make-joint acc old-passwords new-password)
  ((acc old-passwords 'add) new-password)
  acc)

(define peter-acc (make-account 100 'secret-password))

(check-equal? ((peter-acc 'secret-password 'withdraw) 40) 60)
(check-equal? ((peter-acc 'not-secret-password 'withdraw) 40) "Неверный пароль")
(check-equal? ((peter-acc 'secret-password 'deposit) 40) 100)

(define paul-acc (make-joint peter-acc 'secret-password 'rosebud))

(check-equal? ((paul-acc 'secret-password 'withdraw) 40) 60)
(check-equal? ((peter-acc 'rosebud 'withdraw) 40) 20)
