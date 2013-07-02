;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |6.2|) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor mixed-fraction #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")))))
;; dimensions of traffic light    
(define WIDTH 50)
(define HEIGHT 160)
(define BULB-RADIUS 20)
(define BULB-DISTANCE 10)

;; the positions of the bulbs 
(define X-BULBS (quotient WIDTH 2))
(define Y-RED (+ BULB-DISTANCE BULB-RADIUS))
(define Y-YELLOW (+ Y-RED BULB-DISTANCE (* 2 BULB-RADIUS)))
(define Y-GREEN (+ Y-YELLOW BULB-DISTANCE (* 2 BULB-RADIUS)))

(define (clear-bulb color)
  (cond
    [(symbol=? color 'green) 
     (and (clear-solid-disk (make-posn X-BULBS Y-GREEN) BULB-RADIUS 'green)
          (draw-circle (make-posn X-BULBS Y-GREEN) BULB-RADIUS 'green))]
    [(symbol=? color 'red) 
     (and (clear-solid-disk (make-posn X-BULBS Y-RED) BULB-RADIUS 'red)
          (draw-circle (make-posn X-BULBS Y-RED) BULB-RADIUS 'red))]
    [(symbol=? color 'yellow) 
     (and (clear-solid-disk (make-posn X-BULBS Y-YELLOW) BULB-RADIUS 'yellow)
          (draw-circle (make-posn X-BULBS Y-YELLOW) BULB-RADIUS 'yellow))]))

(define (draw-bulb color)
  (cond
    [(symbol=? color 'green) 
      (draw-solid-disk (make-posn X-BULBS Y-GREEN) BULB-RADIUS 'green)]
    [(symbol=? color 'red) 
     (draw-solid-disk (make-posn X-BULBS Y-RED) BULB-RADIUS 'red)]
    [(symbol=? color 'yellow) 
     (draw-solid-disk (make-posn X-BULBS Y-YELLOW) BULB-RADIUS 'yellow)]))

;; draw the light with the red bulb turned on
(start WIDTH HEIGHT)
(draw-bulb 'red)

;; switch : symbol symbol -> true
;; to switch a traffic light's current color to a new one
(define (switch old-color new-color)
  (and (clear-bulb old-color) (draw-bulb new-color))) 

;; next : symbol  ->  symbol
;; to switch a traffic light's current color and to return the next one 
(define (next current-color)
  (cond
    [(and (symbol=? current-color 'red) (switch 'red 'green))
     'green]
    [(and (symbol=? current-color 'yellow) (switch 'yellow 'red))
     'red]
    [(and (symbol=? current-color 'green) (switch 'green 'yellow))
     'yellow]))

(next 'red)
(next 'green)
(next 'yellow)
(next 'red)


