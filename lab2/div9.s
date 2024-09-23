# div9.s
# q-osterhage@onu.edu
# September 2024
# Description: returns 1 if a defined constant is divisible 9, else returns 0

test: addi s0, zero, 19 # Loading register s0 with a constant integer value

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