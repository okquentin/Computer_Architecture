test: addi s0, zero, 19 # Loading register s0 with an integer value

check:
    beq s0, zero, divisible
    blt s0, zero, indivisible
    addi s0, s0, -9 
    j check

divisible:
    addi a0, zero, 1
    j done

indivisible:

done: 
    add x0 x0 x0