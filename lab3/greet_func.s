# greet_func.s
# q-osterhage@onu.edu
# September 2024
# Description: considering N people in a room, suppose each person can greet each other only once.
# This function calculates how many greetings would occur
main:
    addi a0, x0, 4 # Define a0 = N
    jal x1, greet_calc
    jal x0, done

greet_calc:
    addi a0, a0, -1
    beq a0, x0, return
    add t0, t0, a0
    jal x0, greet_calc

return:
    add a0, x0, t0

done:
    add x0, x0, x0




