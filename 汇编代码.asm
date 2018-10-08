START:  
        MOV R1,70H
        MOV R2,0AH
L0:
        IN1 R0
        STOI R0,(R1)
        MOV R3,01H
        ADD R3,R1
        MOV R3,01H
        SUB R3,R2
        JNZ OVER
        MOV R0,0
        MOV R1,70H
        MOV R3,09H
        STO R3,80H //将循环次数存在 80H

L1:
        MOV R1,70H
        MOV R0,0H
        LAD 80H,R2
        MOV R3,01H
        SUB R3,R2
        STO R3,80H
        JNZ SORT
RES:
        MOV R1,74H
        MOV R2,75H
        ADD R1,R2
        SHR R2
        OUT1 R2

END:    MOV R1,01H  //死循环
        MOV R2,0H
        SUB R1,R2
        JNZ END
SORT:   
        MOV R2,01H
        ADD R1,R2
        STO R1,81H
        STO R2,82H
        LAD1 (R1),R3
        MOV R1,0H
        ADD R3,R1
        LAD1 (R2),R3
        MOV R2,0H
        ADD R3,R2
        SUB R1,R2
        JC REVISE
        LAD 81H,R1          //------------
        LAD 82H,R2
        LAD1 (R1),R3         //交换数据
        LAD1 (R2),R1
        STOI R3,(R2)
        LAD 81H,R2
        STOI R1,(R2)        //--------------
REVISE:
        LAD 81H,R1
        MOV R3,01H
        ADD R3,R1
        ADD R3,R0
        LAD 80H,R3
        SUB R3,R0
        JNZ SORT
        MOV R1,01H 
        MOV R2,0H
        SUB R1,R2
        JNZ L1



         


        
        




