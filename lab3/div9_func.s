# div9_func.s
# q-osterhage@onu.edu
# September 2024
# Description: returns 1 if a defined constant is divisible 9, else returns 0
# implemented as a callable function

addi a0, zero, 18 # Initalize parameter with constant 
jal ra, div9 
jal x0, done

div9: 
    addi sp, sp, -9

check:
    beq a0, zero, divisible
    blt a0, zero, indivisible
    addi a0, a0, -9
    jal x0, div9

divisible:
    addi a0, zero, 1
    jr ra

indivisible:
    addi a0, zero, 0

done: 
    add x0 x0 x0