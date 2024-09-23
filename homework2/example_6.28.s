
main:
    addi s0, x0, 5
    jal factorial
    add s0, x0, a0
    j done

factorial: 
    addi sp, sp, −8
    sw a0, 4(sp)
    sw ra, 0(sp)
    addi t0, zero, 1
    bgt a0, t0, else
    addi a0, zero, 1
    addi sp, sp, 8
    jr ra

else:
    addi a0, a0, -1
    jal factorial
    lw t1, 4(sp)
    lw ra, 0(sp)
    addi sp, sp, 8
    mul a0, t1, a0
    jr ra

done:
    add x0,x0,x0