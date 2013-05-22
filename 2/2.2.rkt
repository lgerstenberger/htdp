;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2.2|) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor mixed-fraction #f #t none #f ((lib "convert.rkt" "teachpack" "htdp")))))
(define (Fahrenheit->Celsius temp)
  (* 5/9 (- temp 32)))
(define (dollar->euro currency)
  (/ currency 1.29 ))
(define (triangle length height)
  (* 1/2 length height))
(define (convert3 d1 d2 d3)
  (+ (* 100 d3) (* 10 d2) (* 1 d1)))
(define (f n)
  (- 2 (/ 1 n)))
(f 5)