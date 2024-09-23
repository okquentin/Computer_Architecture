# gcd_func.s
# q-osterhage@onu.edu
# September 2024
# Description: Finds GCD of two unsigned input arguments a and b
# according to the Euclidean algorithm

main:
    addi a0, zero, 48 # Initalize parameters with constant
    addi a1, zero, 64
    jal ra, gcd 
    jal x0, done

gcd:
    beq a0, a1, return
    blt a0, a1, a1bigger
    sub t0, a0, a1
    add a0, x0, t0
    jal x0, gcd

a1bigger:
    sub t0, a1, a0
    add a1, x0, t0
    jal x0, gcd

return:
    jr ra

done:
    add x0, x0, x0