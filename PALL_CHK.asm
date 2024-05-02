DATA_SEG SEGMENT
    STRING DB 'ABCDDCBA'
    PAL_CHECK DB 0
    LEN DW 8
DATA_SEG ENDS

CODE_SEG SEGMENT
    ASSUME CS:CODE_SEG, DS:DATA_SEG
    
START: MOV AX, DATA_SEG
       MOV DS, AX
       
       MOV SI, OFFSET STRING
       MOV CX, LEN
       MOV DI, SI
       DEC CX
       ADD DI, CX
       
       AGAIN: MOV AL, [SI]
              CMP AL, [DI]
              JNE NO_PAL
              INC SI
              DEC DI
              CMP SI, DI
              ;JNE AGAIN
              JC AGAIN
              MOV PAL_CHECK, 1
              JMP SKIP
              
       NO_PAL: MOV PAL_CHECK, 0
       
       SKIP : MOV AH, 4CH
       INT 21H
       
CODE_SEG ENDS
END START
       
    