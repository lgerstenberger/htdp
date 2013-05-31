;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |3.1|) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor mixed-fraction #f #t none #f ((lib "convert.rkt" "teachpack" "htdp")))))
(define max-attendees 870)
(define attendance-decline-per-dollar -150)
(define fixed-cost-per-attendee 1.5)

;; attendees : number  ->  number
;; to compute the number of attendees, given ticket-price
(define (attendees ticket-price)
  (+ max-attendees (* attendance-decline-per-dollar ticket-price)))

;; cost : number  ->  number
;; to compute the costs, given ticket-price
(define (cost ticket-price)
  (* fixed-cost-per-attendee (attendees ticket-price)))

;; revenue : number  ->  number
;; to compute the revenue, given ticket-price 
(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

;; profit : number  ->  number
;; to compute the profit as the difference between revenue and costs
;; at some given ticket-price
(define (profit ticket-price) 
  (- (revenue ticket-price) (cost ticket-price)))

;; How not to design a program 
(define (bad-profit price)
  (- (* (+ 120
	   (* (/ 15 .10)
	      (- 5.00 price)))
	price) 
	(* 1.5
	   (+ 120
	      (* (/ 15 .10)
		 (- 5.00 price))))))