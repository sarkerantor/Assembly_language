.MODEL SMALL
.STACK 100H
.DATA
    N CX 5
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 5        ; Print 1 to 5
    MOV DL, '1'

PRINT_LOOP:
    MOV AH, 02H
    INT 21H
    INC DL
    LOOP PRINT_LOOP

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN




.MODEL SMALL
.STACK 100H
.DATA
    N DW 5
    MSG DB 'Numbers: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Message Print
    MOV AH, 09H
    LEA DX, MSG
    INT 21H

    ; Loop Setup
    MOV CX, N        ; Loop 5 times
    MOV DL, '1'      ; Start from '1'

PRINT_LOOP:
    ; Print Character
    MOV AH, 02H
    INT 21H

    ; Save DL value before printing space
    MOV BL, DL

    ; Print Space
    MOV DL, ' '
    MOV AH, 02H
    INT 21H

    ; Restore DL and Increment
    MOV DL, BL
    INC DL

    LOOP PRINT_LOOP

    ; Exit Program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
