DATA_SEG SEGMENT
    NUM DB 77H
    ONE DB 0
    ZEROS DB 0
DATA_SEG ENDS

CODE_SEG SEGMENT
    ASSUME CS:CODE_SEG, DS:DATA_SEG
    
START:
    MOV AX, DATA_SEG
    MOV DS, AX
    MOV CL, 8
    
    MOV AL, NUM
    AGAIN: ROR AL, 1
           JC ONES
           INC ZEROS
           JMP NEXT
    
    ONES : INC ONE
    NEXT: LOOP AGAIN
    MOV AH, 4CH
    INT 21H
    
CODE_SEG ENDS
END START
