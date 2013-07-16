;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |6.6|) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor mixed-fraction #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")))))
;; posn number symbol
(define-struct circle (center radius color))

;; draw-circle : number number symbol ->

;; draw-a-circle : circle ->
(define (draw-a-circle a-circle)
  (draw-circle (circle-center a-circle) 
               (circle-radius a-circle) 
               (circle-color a-circle)))

;; in-circle? : circle posn -> boolean
(define (in-circle? a-circle a-posn)
  (<= (sqrt (+ (sqr (- (posn-x (circle-center a-circle)) (posn-x a-posn))) 
               (sqr (- (posn-y (circle-center a-circle)) (posn-y a-posn))))) 
      (circle-radius a-circle)))

(define death-circle (make-circle (make-posn 30 30) 15 'red))

(in-circle? death-circle (make-posn 6 1.5)) "should be" true

(in-circle? death-circle (make-posn 8 6)) "should be" false


;; translate-circle : circle number -> circle
(define (translate-circle a-circle delta)
  (make-circle (make-posn (+ delta (posn-x (circle-center a-circle)))  
                          (posn-y (circle-center a-circle)))   
               (circle-radius a-circle) 
               (circle-color a-circle)))

(translate-circle (make-circle (make-posn 6 2) 4 'blue) 7) "should be" 
(make-circle (make-posn 13 2) 4 'blue)

;; clear-a-circle : circle ->
(define (clear-a-circle a-circle)
  (clear-circle (circle-center a-circle) 
               (circle-radius a-circle) 
               (circle-color a-circle)))

;; draw-and-clear-circle : circle ->
(define (draw-and-clear-circle a-circle)
   (and (draw-a-circle a-circle) 
        (sleep-for-a-while 1/2)  
        (clear-a-circle a-circle)))

;; posn number number color
(define-struct rectangle (corner width height color))

;; draw-a-rectangle : rectangle -> 
(define (draw-a-rectangle a-rectangle)
  (draw-solid-rect (rectangle-corner a-rectangle)
                  (rectangle-width a-rectangle)
                  (rectangle-height a-rectangle)
                  (rectangle-color a-rectangle)))

;; in-rectangle? : rectangle posn -> boolean
(define (in-rectangle? a-rectangle a-posn)
  (and (< 0 
          (- (posn-x a-posn) (posn-x (rectangle-corner a-rectangle)))
          (rectangle-width a-rectangle))
       (< 0 
          (- (posn-y a-posn) (posn-y (rectangle-corner a-rectangle)))
          (rectangle-height a-rectangle))))

(in-rectangle? (make-rectangle (make-posn 2 3) 3 2 'red) (make-posn 4 4)) "should be" true

(in-rectangle? (make-rectangle (make-posn 2 3) 3 2 'red) (make-posn 8 6)) "should be" false

;; translate-rectangle : rectangle number -> rectangle
(define (translate-rectangle a-rectangle delta)
  (make-rectangle (make-posn (+ delta (posn-x (rectangle-corner a-rectangle)))  
                             (posn-y (rectangle-corner a-rectangle)))   
                  (rectangle-width a-rectangle)
                  (rectangle-height a-rectangle)
                  (rectangle-color a-rectangle)))

;; clear-a-rectangle : rectangle ->
(define (clear-a-rectangle a-rectangle)
  (clear-solid-rect (rectangle-corner a-rectangle) 
               (rectangle-width a-rectangle) 
               (rectangle-height a-rectangle)
               (rectangle-color a-rectangle)))

;; draw-and-clear-rectangle : rectangle ->
(define (draw-and-clear-rectangle a-rectangle)
   (and (draw-a-rectangle a-rectangle) 
        (sleep-for-a-while 1/2)  
        (clear-a-rectangle a-rectangle)))

;; move-rectangle : number rectangle  ->  rectangle
;; to draw and clear a rectangle, translate it by delta pixels
(define (move-rectangle delta a-rectangle)
  (cond
    [(draw-and-clear-rectangle a-rectangle) 
     (translate-rectangle a-rectangle delta)]
    [else a-rectangle]))
