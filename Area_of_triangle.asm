.MODEL SMALL
.STACK 100H
.DATA
    BASE DB 6
    HEIGHT DB 8
    AREA DB ?
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AL, BASE
    MUL HEIGHT       ; AX = BASE * HEIGHT
    MOV BL, 2
    DIV BL           ; AL = AX / 2
    MOV AREA, AL

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN




.MODEL SMALL
.STACK 100H

.DATA
    BASE   DB 6
    HEIGHT DB 8
    MSG    DB 'Area = $'

.CODE
MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    ; Calculate Area = (Base * Height) / 2
    MOV AL, BASE
    MUL HEIGHT
    MOV BL, 2
    DIV BL

    ; Save result
    MOV CL, AL

    ; Print message
    LEA DX, MSG
    MOV AH, 09H
    INT 21H

    ; Print tens digit
    MOV AL, CL
    MOV AH, 0
    MOV BL, 10
    DIV BL

    MOV BH, AH

    ADD AL, '0'
    MOV DL, AL
    MOV AH, 02H
    INT 21H

    ; Print ones digit
    MOV DL, BH
    ADD DL, '0'
    MOV AH, 02H
    INT 21H

    ; Exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
