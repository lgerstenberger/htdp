;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2.3|) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor mixed-fraction #f #t none #f ((lib "convert.rkt" "teachpack" "htdp")))))
(define (wage h)
  (* 12 h))

(define (tax gross)
  (* .15 gross))

(define (netpay h)
  (- (wage h) (tax (wage h))))

(define (sum-coins p n d q)
  (+ (* .01 p) (* .05 n) (* .1 d) (* .25 q))) 

(define (total-profit c)
  (- (* 5 c) (+ 20 (* .50 c))))