.MODEL SMALL
.STACK 100H
.DATA
    N DW 6
    FIB DB 10 DUP(?)
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV SI, OFFSET FIB
    MOV AL, 0
    MOV [SI], AL
    INC SI
    MOV AL, 1
    MOV [SI], AL

    MOV CX, N
    SUB CX, 2
L1:
    MOV AL, [SI-1]
    ADD AL, [SI]
    INC SI
    MOV [SI], AL
    LOOP L1

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN








.MODEL SMALL
.STACK 100H
.DATA
    N DW 6
    FIB DB 10 DUP(?)
    MSG DB 'Fibonacci Series: $'
    SPACE DB ' $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Message Print
    MOV AH, 09H
    LEA DX, MSG
    INT 21H

    ; Memory Address Offset Setup
    MOV SI, OFFSET FIB
    
    ; First elements initialization
    MOV AL, 0
    MOV [SI], AL
    INC SI
    MOV AL, 1
    MOV [SI], AL

    ; Calculating Fibonacci Sequence
    MOV CX, N
    SUB CX, 2
L1:
    MOV AL, [SI-1]
    ADD AL, [SI]
    INC SI
    MOV [SI], AL
    LOOP L1

    ; Print Fibonacci Numbers to Screen
    MOV SI, OFFSET FIB
    MOV CX, N

PRINT_LOOP:
    MOV DL, [SI]
    ADD DL, '0'        ; Convert number to ASCII character

    MOV AH, 02H        ; Print single character
    INT 21H

    ; Print Space
    MOV AH, 02H
    MOV DL, ' '
    INT 21H

    INC SI
    LOOP PRINT_LOOP

    ; Exit Program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
