#lang racket/base

(require rackunit)
(require racket/trace)

(define (make-mobile left right)
	(list left right))

(define (left-branch mobile)
	(car mobile))

(define (right-branch mobile)
	(cadr mobile))

(define (make-branch length structure)
	(list length structure))

(define (branch-length branch)
	(car branch))

(define (branch-structure branch)
	(cadr branch))

(define (branch-weight branch)
	(define struc (branch-structure branch))
	(if (pair? struc)
		(total-weight struc)
		struc))

(define (total-weight mobile)
	(+ (branch-weight (left-branch mobile))
		 (branch-weight (right-branch mobile))))

(define (moment branch)
	(* (branch-weight branch)
		 (branch-length branch)))

(define (is-balanced-branch branch)
	(define struc (branch-structure branch))
	(if (pair? struc)
		(is-total-balanced struc)
		#t))

(define (is-total-balanced mobile)
	(define left (left-branch mobile))
	(define right (right-branch mobile))
	(and (is-balanced-branch left)
			 (is-balanced-branch right)
		   (= (moment left)
		 			(moment right))))

(define branch1 (make-branch 10 20))
(define branch2 (make-branch 17 9))
(define mobile1 (make-mobile branch1 branch2))
(define branch3 (make-branch 5 mobile1))
(define mobile2 (make-mobile branch3 branch2))
(define branch4 (make-branch 11 mobile2))
(define mobile3 (make-mobile branch3 branch4))

(trace branch-structure)
(trace branch-weight)

(check-equal? (branch-weight branch1) 20)
(check-equal? (total-weight mobile1) 29)
(check-equal? (total-weight mobile2) 38)
(check-equal? (total-weight mobile3) 67)

(check-equal? (branch-length branch3) 5)
(check-equal? (moment branch3) 145)

(check-equal? (is-balanced-branch branch1) #t)
(check-equal? (is-total-balanced mobile3) #f)
