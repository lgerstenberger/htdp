;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |6.3|) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor mixed-fraction #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")))))
(define-struct movie (title producer))
;; make-movie
;; movie-title movie-producer

(define-struct boyfriend (name hair eyes phone))
;; make-boyfriend
;; boyfriend-name boyfriend-hair boyfriend-eyes boyfriend-phone

(define-struct cheerleader (name number))
;; make-cheerleader
;; cheerleader-name cheerleader-number

(define-struct CD (artist title price))
;; make-CD
;; CD-artist CD-title CD-price

(define-struct sweater (material size producer))
;; make-sweater
;; sweater-material sweater-size sweater-producer

(define-struct fighter (designation acceleration top-speed range))

(define (within-range a-fighter distance)
  (<= distance (fighter-range a-fighter)))

(within-range (make-fighter 'tornado 1.2 5 4) 3) "should be" true
(within-range (make-fighter 'tornado 1.2 5 4) 8) "should be" false

(define (reduce-range a-fighter)
  (make-fighter (fighter-designation a-fighter)
                (fighter-acceleration a-fighter)
                (fighter-top-speed a-fighter)
                (* .8 (fighter-range a-fighter))))
           
(reduce-range (make-fighter 'tornado 1.2 5 4)) "should be" (make-fighter 'tornado 1.2 5 3.2)