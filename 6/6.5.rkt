;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |6.5|) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor mixed-fraction #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")))))
;; (make-time number number number)
(define-struct time (hours minutes seconds))

;; (make-word symbol('a - 'z) symbol('a - 'z) symbol('a - 'z))
(define-struct word (letter1 letter2 letter3))

;; time->seconds: struct -> number
(define (time->seconds a-time)
(+ (* (time-minutes a-time) 60) 
   (* (time-hours a-time) 60 60)
   (time-seconds a-time)))







                            