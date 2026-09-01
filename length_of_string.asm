.MODEL SMALL
.STACK 100H
.DATA
    STR DB 'ASSEMBLY$', 0
    LEN DB 0
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV SI, OFFSET STR
    MOV CL, 0

COUNT_LOOP:
    MOV AL, [SI]
    CMP AL, '$'
    JE DONE
    INC CL
    INC SI
    JMP COUNT_LOOP

DONE:
    MOV LEN, CL

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN










.MODEL SMALL
.STACK 100H
.DATA
    STR DB 'ASSEMBLY$', 0
    LEN DB 0
    MSG1 DB 'String: $'
    MSG2 DB 0DH, 0AH, 'Length: $'  ; 0DH, 0AH দিয়ে নিউ-লাইন দেওয়া হয়েছে

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Calculate String Length
    MOV SI, OFFSET STR
    MOV CL, 0

COUNT_LOOP:
    MOV AL, [SI]
    CMP AL, '$'
    JE DONE
    INC CL
    INC SI
    JMP COUNT_LOOP

DONE:
    MOV LEN, CL

    ; Print Original String
    MOV AH, 09H
    LEA DX, MSG1
    INT 21H

    LEA DX, STR
    INT 21H

    ; Print Length Message
    LEA DX, MSG2
    INT 21H

    ; Print Single Digit Number (Length: 8)
    MOV DL, LEN
    ADD DL, '0'       ; Convert to ASCII character
    MOV AH, 02H
    INT 21H

    ; Exit Program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
