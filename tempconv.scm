#!/usr/bin/guile \
-e main -s
!#

(use-modules (ice-9 format))


(define (celcius t)
  (* (- t 32) 5/9))


(define (fahrenheit t)
  (+ (* t 9/5) 32))


(define (convert-temp t u)
  (cond 
   [(char-ci=? u #\f) (celcius t)]
   [(char-ci=? u #\c) (fahrenheit t)]))


(define (convert-unit u)
  (cond
   [(char-ci=? u #\f) "C"]
   [(char-ci=? u #\c) "F"]))


(define (yank-unit s)
  (string-ref (string-take-right s 1) 0))


(define (yank-temp s)
  (string-drop-right s 1))


(define (print-converted-temp temp-input)
  (let ((temp-unit (yank-unit temp-input))
        (temp-number (string->number (yank-temp temp-input))))
    (format #t "~2,1f~A\n"
            (convert-temp temp-number temp-unit)
            (convert-unit temp-unit))))


(define (main args)
  (map
    print-converted-temp
    (cdr args)))
