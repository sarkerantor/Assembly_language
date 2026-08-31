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
