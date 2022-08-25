#lang racket

#| Actividad integradora 3.4 - Resaltador de sintaxis
TC2037 grupo 600
Alexa Sofía Arreola Alvarado A01177452
Ana Fernanda Chacón Lomelí   A00830052
Ricardo González Garza       A01721007

24 de abril del 2022
|#

(define (imprime lista p2)
  (define (despliega lista p2)
    (display (first lista) p2)
    (display (second lista) p2)
    (display (third lista) p2)
    (newline p2)
    1)
  (if (empty? lista)
      0
      (+(despliega (car lista) p2) (imprime (cdr lista)p2))))

(define (leeNumero atomo)
  (if (regexp-match-exact? #px"-?\\d+" (number->string atomo)) 
      (list (string-append "<a style=" "\"" "color:#6aa84f"  "\"" ">") (number->string atomo) "</a>")
      (if (regexp-match-exact? #px"-?\\d*\\.\\d+" (number->string atomo))
          (list (string-append "<a style=" "\"" "color:#b6d7a8"  "\"" ">") (number->string atomo) "</a>")
          (if (regexp-match? #rx"e" (number->string atomo))
              (list (string-append "<a style=" "\"" "color:#b6d7a8"  "\"" ">") (number->string atomo) "</a>")
              (list (string-append "<a style=" "\"" "color:#000000"  "\"" ">") (number->string atomo) "</a>")))))

(define (convierte atomo lectura)
  (if (number? atomo)
      (leeNumero atomo)
      (if (string? atomo)
          (list (string-append "<a style=" "\"" "color:#7f6000"  "\"" ">" "\"") atomo "\"</a>")
          (if (regexp-match-exact? #rx"||" (symbol->string atomo))
              (list (string-append "<a style=" "\"" "color:#e06666"  "\"" ">") "||" "</a>")
              (if (regexp-match-exact? #rx"&&|!" (symbol->string atomo))
                  (list (string-append "<a style=" "\"" "color:#e06666"  "\"" ">") (symbol->string atomo) "</a>")
                  (if (regexp-match-exact? #rx"\\+|-|\\*|/" (symbol->string atomo))
                      (list (string-append "<a style=" "\"" "color:#f6b26b"  "\"" ">") (symbol->string atomo) "</a>")
                      (if (regexp-match-exact? #rx"=" (symbol->string atomo))
                          (list (string-append "<a style=" "\"" "color:#ffd966"  "\"" ">") (symbol->string atomo) "</a>")
                          (if (regexp-match-exact? #rx"==|<|>|!=" (symbol->string atomo))
                              (list (string-append "<a style=" "\"" "color:#cdcd24"  "\"" ">") (symbol->string atomo) "</a>")
                              (if (regexp-match-exact? #rx"cout|cin|<<|>>|endl" (symbol->string atomo))
                                  (list (string-append "<a style=" "\"" "color:#008f39"  "\"" ">") (symbol->string atomo) "</a>")
                                  (if (regexp-match-exact? #rx"true|false" (symbol->string atomo))
                                      (list (string-append "<a style=" "\"" "color:#ff00ff"  "\"" ">") (symbol->string atomo) "</a>")
                                      (if (regexp-match? #rx"!" (symbol->string atomo))
                                          (list (string-append "<a style=" "\"" "color:#e06666"  "\"" ">") "!</a>" (string-join (convierte (string->symbol (substring (symbol->string atomo) 1 (string-length(symbol->string atomo)))) lectura)))
                                          (if (regexp-match-exact? #rx"for" (symbol->string atomo))
                                              (list (string-append "<a style=" "\"" "color:#a2c4c9"  "\"" ">") (symbol->string atomo) "</a>")
                                              (if (regexp-match-exact? #rx"//" (symbol->string atomo))
                                                  (list (string-append "<a style=" "\"" "color:#8e7cc3"  "\"" ">" "//") (read-line lectura) "</a><br>")
                                                  (if (regexp-match-exact? #rx"if|else" (symbol->string atomo))
                                                      (list (string-append "<a style=" "\"" "color:#0b5394"  "\"" ">") (symbol->string atomo) "</a>")
                                                      (if (regexp-match-exact? #rx"int|string|float|double|bool|char|void" (symbol->string atomo))
                                                          (list (string-append "<a style=" "\"" "color:#bf9000"  "\"" ">") (symbol->string atomo) "</a>")
                                                          (if (regexp-match-exact? #rx"\\(|\\)\\{|\\}" (symbol->string atomo))
                                                              (list (string-append "<a style=" "\"" "color:#dc4b92"  "\"" ">") (symbol->string atomo) "</a>")
                                                              (if (regexp-match-exact? #rx"return" (symbol->string atomo))
                                                                  (list (string-append "<a style=" "\"" "color:#FF0000"  "\"" ">") (symbol->string atomo) "</a>")
                                                                  (if (regexp-match-exact? #px"[[:alpha:]_]\\w*" (symbol->string atomo))
                                                                      (list (string-append "<a style=" "\"" "color:#a4c2f4"  "\"" ">") (symbol->string atomo) "</a>")
                                                                      (list (string-append "<a style=" "\"" "color:#000000"  "\"" ">") (symbol->string atomo) "</a>")))))))))))))))))))

(define (recorre-2 p1)
  (if (eof-object? (peek-char p1))
      '()
      (if (or (char=? (peek-char p1) #\() (char=? (peek-char p1) #\)) (char=? (peek-char p1) #\{) (char=? (peek-char p1) #\}))
          (append (list (list (string-append "<a style=" "\"" "color:#dc4b92"  "\"" ">") (string(read-char p1)) "</a>")) (recorre-2 p1))
          (if (regexp-match-exact? #rx"#" (string (peek-char p1)))
              (begin
                (read-char p1)
                (append (list (list (string-append "<a style=" "\"" "color:#999999"  "\"" ">" "&num;") (symbol->string (read p1)) "</a>")) (recorre-2 p1)))
              (if (regexp-match-exact? #rx"<" (string (peek-char p1)))
                  (begin
                    (read-char p1)
                    (if (char-alphabetic? (peek-char p1))
                        (append (list (list (string-append "<a style=" "\"" "color:#999999"  "\"" ">" "&lt;") (string-replace (symbol->string(read p1)) ">" "&gt;") "</a>")) (recorre-2 p1))
                        (if (regexp-match-exact? #rx"<" (string (peek-char p1)))
                            (begin
                              (read-char p1)
                              (append (list (convierte '<< p1)) (recorre-2 p1)))
                            (append (list (convierte '< p1)) (recorre-2 p1)))))
                  (if (equal? (peek-char p1) #\return)
                      (begin
                        (read-char p1)
                        (append (list(list "<" "br" ">")) (recorre-2 p1)))
                      (if (equal? (peek-char p1) #\newline)
                          (begin
                            (read-char p1)
                            (recorre-2 p1))
                          (if (equal? (peek-char p1) #\space)
                              (begin
                                (read-char p1)
                                (append (list(list "<a>" "&nb" "sp")) (list(list "</" "a" ">")) (recorre-2 p1)))
                              (if (regexp-match-exact? #rx",|;" (string (peek-char p1)))
                                  (append (list (list (string-append "<a style=" "\"" "color:#FF0000"  "\"" ">") (string(read-char p1)) "</a>")) (recorre-2 p1))
                                  (append (list (convierte (read p1) p1)) (recorre-2 p1)))))))))))


(define (resaltadorSintaxis file1)
  (define p1 (open-input-file file1))
  (define p2 (open-output-file "output.html"))
  (define lista (recorre-2 p1))
  (display "<!DOCTYPE html>" p2)
  (newline p2)
  (display "<html><body style=\"background-color: black; font-size: 110%; font-family: verdana;\">" p2)
  (newline p2)
  (imprime lista p2)
  (display "</body></html>" p2)
  (close-output-port p2)
  (close-input-port p1)
  )