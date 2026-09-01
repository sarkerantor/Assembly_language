.MODEL SMALL
.STACK 100H
.DATA
    N DW 10
    SUM DW 0
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AX, 0
    MOV CX, N

SUM_LOOP:
    ADD AX, CX
    LOOP SUM_LOOP

    MOV SUM, AX

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN






.MODEL SMALL
.STACK 100H
.DATA
    N DW 10
    SUM DW 0
    MSG DB 'Sum: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Calculate Sum of 1 to N
    MOV AX, 0
    MOV CX, N

SUM_LOOP:
    ADD AX, CX
    LOOP SUM_LOOP

    MOV SUM, AX

    ; Display Message
    MOV AH, 09H
    LEA DX, MSG
    INT 21H

    ; Print Number (Max 2 Digits: 0-99)
    MOV AX, SUM
    MOV BL, 10
    DIV BL            ; AL = Tens digit (5), AH = Units digit (5)

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
