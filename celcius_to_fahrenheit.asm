.MODEL SMALL
.STACK 100H
.DATA
    C DB 25
    F DB ?
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AL, C
    MOV BL, 9
    MUL BL           ; AX = C * 9
    MOV BL, 5
    DIV BL           ; AL = AX / 5
    ADD AL, 32       ; AL = AL + 32
    MOV F, AL

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN





.MODEL SMALL
.STACK 100H
.DATA
    C DB 25
    F DB ?
    MSG DB 'Fahrenheit: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Calculation: F = (C * 9 / 5) + 32
    MOV AL, C
    MOV BL, 9
    MUL BL            ; AX = 25 * 9 = 225
    MOV BL, 5
    DIV BL            ; AL = 225 / 5 = 45
    ADD AL, 32        ; AL = 45 + 32 = 77
    MOV F, AL

    ; Display Message
    MOV AH, 09H
    LEA DX, MSG
    INT 21H

    ; Print Number (Max 2 Digits: 0-99)
    MOV AL, F
    MOV AH, 0
    MOV BL, 10
    DIV BL            ; AL = Tens digit (7), AH = Units digit (7)

    MOV BX, AX        ; Save result in BX

    ; Print Tens Digit
    MOV DL, BL
    ADD DL, '0'       ; Convert to ASCII
    MOV AH, 02H
    INT 21H

    ; Print Units Digit
    MOV DL, BH
    ADD DL, '0'       ; Convert to ASCII
    MOV AH, 02H
    INT 21H

    ; Exit Program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN


