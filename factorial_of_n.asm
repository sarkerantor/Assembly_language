.MODEL SMALL
.STACK 100H
.DATA
    N DW 5
    FACT DW 1
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AX, 1
    MOV CX, N

FACT_LOOP:
    MUL CX           ; AX = AX * CX
    LOOP FACT_LOOP

    MOV FACT, AX

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN







.MODEL SMALL
.STACK 100H
.DATA
    N DW 5
    FACT DW 1
    MSG DB 'Factorial: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Calculate Factorial
    MOV AX, 1
    MOV CX, N

FACT_LOOP:
    MUL CX           ; AX = AX * CX (1 * 5 * 4 * 3 * 2 * 1 = 120)
    LOOP FACT_LOOP

    MOV FACT, AX

    ; Display Message
    MOV AH, 09H
    LEA DX, MSG
    INT 21H

    ; Print Number (3 Digits Handling for 120)
    MOV AX, FACT
    
    ; 100 দিয়ে ভাগ করে Hundreds Digit বের করা
    MOV DX, 0
    MOV BX, 100
    DIV BX           ; AX = Quotient (Hundreds), DX = Remainder

    PUSH DX          ; Remainder সেভ রাখা হলো

    ; Print Hundreds Digit
    MOV DL, AL
    ADD DL, '0'
    MOV AH, 02H
    INT 21H

    ; বাকী অংশ (Remainder) থেকে Tens & Units Digit বের করা
    POP AX           ; Remainder ব্যাক আনা হলো
    MOV BL, 10
    DIV BL           ; AL = Tens, AH = Units

    MOV BX, AX       ; AX সেভ রাখা হলো

    ; Print Tens Digit
    MOV DL, BL
    ADD DL, '0'
    MOV AH, 02H
    INT 21H

    ; Print Units Digit
    MOV DL, BH
    ADD DL, '0'
    MOV AH, 02H
    INT 21H

    ; Exit Program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
