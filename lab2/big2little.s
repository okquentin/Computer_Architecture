# big2little.s
# q-osterhage@onu.edu
# September 2024
# Description: converts a multi-word value (8 words, starting from 0x300)
# from big endian to little endian

addi s0, zero, 8 # word count of value / counter for tracking destination address during swap
addi s1, zero, 0x300 # starting Address Location Pointer
addi s2, zero, 0 # offset / counter for tracking current address during swap
addi s3, zero, 0x01 # value for initalizing registers (starts at 0x01 and increments)

# Initializing Regisers
initialize:
    slli t0, s2, 2 # multiply counter by 4 to find offset
    add t1, s1, t0 # add offset to base address
    sw s3, 0(t1) # store the value at the current address
    addi s3, s3, 1 # increment value for next word
    addi s2, s2, 1 # increment counter
    blt s2, s0, initialize # check if counter is less than word count
    # resetting values of t0, t1, and s2 to reuse them in wordswap
    add t0, x0, x0
    add t1, x0, x0
    add s2, x0, x0

wordswap: # using s0 (word count) as a "decrementing counter"
    beq s0, s2, done # when incrementing and decrementing counter meet, all swaps are finished

    # multiply decrementing counter by 4 and subtract 4 to find destination address
    slli t0, s0, 2 
    addi t0, t0, -4
    add t0, t0, s1 # address of destination register

    # multiply incrementing counter by 4 for current register address 
    slli t1, s2, 2
    add t1, t1, s1 # address of current register

    lw t2, 0(t0) # load word from destination address to temp register
    lw t3, 0(t1) # load word from current address to temp register

    sw t3, 0(t0) # store current word @ destination address
    sw t2, 0(t1) # store destination word @ current address

    addi s0, s0, -1 # decrement counter
    addi s2, s2, 1 # increment counter

    j wordswap

done:
    add x0, x0, x0