.MODEL SMALL
.STACK 100H
.DATA
    ARRAY DB 10, 20, 30, 40, 50
    N DB 5
    AVG DB ?
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV SI, OFFSET ARRAY
    MOV CL, N
    MOV CH, 0
    MOV AX, 0

AVG_LOOP:
    ADD AL, [SI]
    ADC AH, 0        ; Handle carry
    INC SI
    LOOP AVG_LOOP

    DIV N            ; AL = AX / N
    MOV AVG, AL

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN








.MODEL SMALL
.STACK 100H
.DATA
    ARRAY DB 10, 20, 30, 40, 50
    N DB 5
    AVG DB ?
    MSG DB 'Average: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV SI, OFFSET ARRAY
    MOV CL, N
    MOV CH, 0
    MOV AX, 0

AVG_LOOP:
    ADD AL, [SI]
    ADC AH, 0         ; Carry handle করার জন্য
    INC SI
    LOOP AVG_LOOP

    DIV N             ; AL = AX / N (150 / 5 = 30)
    MOV AVG, AL

    ; Display Message
    MOV AH, 09H
    LEA DX, MSG
    INT 21H

    ; Print Number (Max 2 Digits: 0-99)
    MOV AL, AVG
    MOV AH, 0
    MOV BL, 10
    DIV BL            ; AL = Tens digit, AH = Units digit

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
