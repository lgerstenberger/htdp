;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.1|) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor mixed-fraction #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp") (lib "master.rkt" "teachpack" "htdp")))))
(define (reply s)
  (cond
    [(symbol=? s 'GoodMorning) 'Hi]
    [(symbol=? s 'HowAreYou?) 'Fine]
    [(symbol=? s 'GoodAfternoon) 'INeedANap]
    [(symbol=? s 'GoodEvening) 'BoyAmITired]))

(define (check-guess guess target)
  (cond
    [(= target guess) 'Perfect]
    [(> target guess) 'TooSmall]
    [(< target guess) 'TooLarge]))

(check-guess 1 2) "should be" 'TooSmall
(check-guess 2 2) "should be" 'Perfect
(check-guess 2 1) "should be" 'TooLarge

(define (guess a b c)
  (+ (* c 100) (* b 10) a)) 

(define (check-guess3 a b c target)
  (check-guess (guess a b c) target))
  
(check-guess3 3 2 1 122) "should be" 'TooLarge
(check-guess3 2 2 1 122) "should be" 'Perfect
(check-guess3 1 2 1 122) "should be" 'TooSmall

(define (what-kind a b c)
  (cond
    [(= a 0) 'degenerate]
    [(> (sqr b) (* 4 a c)) 'two]
    {(= (sqr b) (* 4 a c)) 'one}
    {(< (sqr b) (* 4 a c)) 'none}))

(what-kind 1 0 -1) "should be" 'two
(what-kind 2 4 2) "should be" 'one
(what-kind 0 1 2) "should be" 'degenerate
(what-kind 1 0 1) "should be" 'none

(define (check-color t1 t2 g1 g2)
  (cond
    [(and (symbol=? t1 g1) (symbol=? t2 g2)) 'Perfect]
    [(or (symbol=? t1 g1) (symbol=? t2 g2)) 'OneColorAtCorrectPosition]
    [(or (symbol=? t1 g1) (symbol=? t2 g2) (symbol=? t2 g1) (symbol=? t1 g2)) 'OneColorOccurs]
    [else 'NothingCorrect]))
    
(check-color 'red 'blue 'red 'pink) "should be" 'OneColorAtCorrectPosition
(check-color 'red 'red 'black 'green) "should be" 'NothingCorrect
(check-color 'red 'blue 'red 'blue) "should be" 'Perfect
(check-color 'red 'green 'green 'red) "should be" 'OneColorOccurs


  
  


