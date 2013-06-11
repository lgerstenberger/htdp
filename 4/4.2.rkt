;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |4.2|) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor mixed-fraction #f #t none #f ((lib "convert.rkt" "teachpack" "htdp")))))
(define (interval-1 x)
  (and (> x 3) (>= 7 x)))

(define (interval-2 x)
  (and (>= x 3) (> 7 x)))

(define (interval-3 x)
  (and (>= x 3) (> 9 x)))

(define (interval-4 x)
  (or (and (> x 1) (> 3 x)) (and (> x 9) (> 11 x))))

(define (interval-5 x)
  (not (and (>= x 1) (>= 3 x))))

;; in-interval-1? : number -> boolean
;; to determine whether x is in the interval (-3,0)
(define (in-interval-1? x)
       (and (< -3 x) (< x 0)))

;; in-interval-2? : number -> boolean
;; to determine whether x is <1 or >2
(define (in-interval-2? x)
       (or (< x 1) (> x 2)))

;; in-interval-3? : number -> boolean
;; to determine whether x is <1 or >5
(define (in-interval-3? x)
       (not (and (<= 1 x) (<= x 5))))

(define (equation1 n)
  (= (+ (* n 4) 2) 62))

(define (equation2 n)
  (= (* (* n n) 2) 102))

;; equation3 : number -> boolean
;; to determine whether n makes equation valid
(define (equation3 n)
  (= (+ (* n n 4) (* n 6) 2) 462))

;; claim for equation3:
(equation3 10)

