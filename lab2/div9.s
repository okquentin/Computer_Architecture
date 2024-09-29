# div9.s
# q-osterhage@onu.edu
# September 2024
# Description: returns 1 if a defined constant is divisible 9, else returns 0

test: addi a0, zero, 18 # Loading register a0 with a constant integer value

check:
    beq a0, zero, divisible
    blt a0, zero, indivisible
    addi a0, a0, -9 
    j check

divisible:
    addi a0, zero, 1
    j done

indivisible:
    add a0, x0, x0

done: 
    add x0 x0 x0