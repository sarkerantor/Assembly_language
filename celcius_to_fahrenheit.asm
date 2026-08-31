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
