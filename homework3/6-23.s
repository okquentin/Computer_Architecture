main:
    addi a0, zero, 24
    addi a1, zero, 3

function:
    addi t2, x0, 0
    add t3, a1, x0
    blt a0, t3, 16
    addi t2, t2, 1
    add t3, t3, a1
    jal x0, -12
    add a0, t2, x0

done:
