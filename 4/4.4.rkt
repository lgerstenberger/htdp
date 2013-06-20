;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |4.4|) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor mixed-fraction #f #t none #f ((lib "convert.rkt" "teachpack" "htdp")))))
;; interest : number  ->  number
;; to determine the amount of interest for the given amount >= 0

(define (interest amount)
  (* amount (cond
    [(<= amount 1000) 0.040]
    [(<= amount 5000) 0.045]
    [(> amount 5000) 0.050])))

;; EXAMPLES TURNED INTO TESTS
(interest 500) "should be" 20
(interest 2000) "should be" 90
(interest 10000) "should be" 500

;; tax : number  ->  number
;; to determine the amount of tax paid on the given grosspay.
(define (tax gross-pay)
  (* gross-pay (cond
    [(<= gross-pay 240) 0.0]
    [(<= gross-pay 480) 0.15]
    [else 0.28])))
(tax 100) "should be" 0
(tax 300) "should be" 45
(tax 500) "should be" 140


(define pay-rate 12)

;; grosspay : number -> number
;; to determine the grosspay given the number of hours worked and the hourly pay rate.
(define (grosspay hours)
  (* hours pay-rate))

(grosspay 40) "should be" 480

;; netpay : number -> number
;; to determine the netpay given the number of hours worked.
(define (netpay hours)
  (- (grosspay hours) (tax (grosspay hours))))

(netpay 40) "should be" 408

(define (0-500 charge)
  (* charge .0025))
  
(define (500-1500 charge)
  (+ (* (- charge 500) .0050)
     (0-500 500)))
 
(define (1500-2500 charge)
  (+ (* (- charge 1500) .0075)
     (500-1500 1500)))

(define (2500-inf charge)
  (+ (* (- charge 2500) .0100)
     (1500-2500 2500)))
 
(define (pay-back charge)
  (cond
    [(<= charge 500) 
     (0-500 charge)]
    [(and (< 500 charge) (<= charge 1000))
     (500-1500 charge)]
    [(and (< 1500 charge) (<= charge 2500))
     (1500-2500 charge)]
    [else 
     (2500-inf charge)]))

     
(pay-back 100) "should be" .25
(pay-back 1000) "should be" 3.75
(pay-back 2000) "should be" 10
(pay-back 3000) "should be" 18.75

(define (how-many a b c)
  (cond
    [(> (sqr b) (* 4 a c)) 2]
    {(= (sqr b) (* 4 a c)) 1}
    {(< (sqr b) (* 4 a c)) 0}))

(how-many 1 0 -1) "should be" 2
(how-many 2 4 2) "should be" 1
