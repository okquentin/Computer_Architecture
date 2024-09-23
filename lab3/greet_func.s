# greet_func.s
# q-osterhage@onu.edu
# September 2024
# Description: considering N people in a room, suppose each person can greet each other only once.
# This function calculates how many greetings would occur
# Essentially calculates Σ(i=1 to N) of N-1 

main:
    addi a0, x0, 4 # define a0 = N
    jal x1, greet_calc # function call, x1 = ra
    jal x0, done # jump to done, exit program

greet_calc:
    addi a0, a0, -1 # decrement N
    beq a0, x0, return # check if N is zero, if so exit the loop
    add t0, t0, a0 # use t0 to save the sum
    jal x0, greet_calc # loop until N is zero

return:
    add a0, x0, t0 # set a0 equal to sum
    jr ra # return to main

done:
    add x0, x0, x0




