# gcd_func.s
# q-osterhage@onu.edu
# September 2024
# Description: Finds GCD of two unsigned input arguments a and b
# according to the Euclidean algorithm

main:
    addi a0, zero, 48 # initalize parameters with constants
    addi a1, zero, 64
    jal ra, gcd # function call
    jal x0, done # jump to done, exit program

gcd:
    beq a0, a1, return # if a=b, end loop; a=b=GCD
    blt a0, a1, a1bigger # check if b>a
    sub t0, a0, a1 # subtract b from a since a>b
    add a0, x0, t0 #load difference into a since a>b
    jal x0, gcd #loop

a1bigger:
    sub t0, a1, a0 # subtract a from b since b>a
    add a1, x0, t0 # load difference into b since b>a
    jal x0, gcd #loop

return:
    jr ra # return to main

done:
    add x0, x0, x0