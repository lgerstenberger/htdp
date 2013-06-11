;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |3.3|) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor mixed-fraction #f #t none #f ((lib "convert.rkt" "teachpack" "htdp")))))
(define cm-per-inch 2.54)
(define in-per-foot 12)
(define ft-per-yd 3)
(define yd-per-rod 5.5)
(define rod-per-furlong 40)
(define furlong-per-mi 8)

(define (inches->cm inches)
  (* cm-per-inch inches))

(define (feet->inches feet)
  (* in-per-foot feet))

(define (yards->feet yards)
  (* ft-per-yd yards))

(define (rods->yards rods)
  (* yd-per-rod rods))

(define (furlongs->rods furlongs)
  (* rod-per-furlong furlongs))

(define (miles->furlongs miles)
  (* furlong-per-mi miles))

(define (feet->cm feet)
  (inches->cm (feet->inches feet)))

(define (yards->cm yards)
  (feet->cm (yards->feet yards)))

(define (rods->inches rods) 
  (feet->inches (yards->feet (rods->yards rods))))

(define (miles->feet miles)
  (yards->feet (rods->yards (furlongs->rods (miles->furlongs miles)))))

(define PI 3.14159)

(define (area-of-circle r)
  (* (sqr r) PI))

(define (volume-cylinder r h)
  (* (area-of-circle r) h))

(define (circumference r)
  (* PI 2 r))

(define (area-of-cylinder r h)
  (+ (* (area-of-circle r) 2) (* (circumference r) h)))

(define (area-pipe inner-radius length thickness)
  (+ (* (circumference inner-radius) length)
     (* (circumference (+ inner-radius thickness)) length)
     (* 2 (- (area-of-circle (+ inner-radius thickness)) 
             (area-of-circle inner-radius)))))

(define (area-donut inner-radius thickness)
  (- (area-of-circle (+ inner-radius thickness)) 
             (area-of-circle inner-radius)))

(define (area-pipe-2 inner-radius length wall-thickness)
  (+ (* (circumference inner-radius) length)
     (* (circumference (+ inner-radius wall-thickness)) length)
     (* 2 (area-donut inner-radius wall-thickness))))  

(define (velocity g t)
  (* g t))

(define (height g t)
  (* .5 (velocity g t) t))

(define (Celsius->Fahrenheit t)
  (+ (* 9/5 t) 32))

(define (Fahrenheit->Celsius temp)
  (* 5/9 (- temp 32)))

;; I : number  ->  number
;; to convert a Fahrenheit temperature to Celsius and back 
(define (I f)
  (Celsius->Fahrenheit (Fahrenheit->Celsius f)))

(I 32)


        
