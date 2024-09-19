# 8 words, start at 0x300

addi s0, zero, 8 # word count of value
addi s1, zero, 0x300 #Starting Address Location Pointer
addi s2, zero, 0 # offset 1

addi s3, zero, 0x01
addi s4, zero, 8 # counter 2
addi s5, zero, 0 # counter 3
addi s6, zero, 4 # to compare counter 3 to end loop

# Initializing Regisers
initialize:
    beq s2, s0, wordswap
    slli t0, s2, 2 # multiply counter by 4 to find offset
    add t1, s1, t0 # add offset to base address
    sw s3, 0(t1) # Store the value at the current address
    addi s3, s3, 1 #Increment value for next word
    addi s2, s2, 1 #Increment counter
    j initialize

wordswap: #s2 counter
    beq s4, s6, done # 8 words = 4 swaps

    #multiply decrementing counter by 4 and subtract 4 to find destination address
    slli t2, s4, 2 
    addi t2, t2, -4
    add t2, t2, s1 #address of destination register

    #multiply incrementing counter by 4 for current register address 
    slli t3, s5, 2
    add t3, t3, s1 #address of current register

    lw t4, 0(t2) #load word from destination address to temp register
    lw t5, 0(t3) #load word from current address to temp register

    sw t5, 0(t2) #store current word @ destination address
    sw t4, 0(t3) #store destination word @ current address

    addi s4, s4, -1 # decrement counter
    addi s5, s5, 1 # increment counter

    #clear address registers
    add t2, x0, x0
    add t3, x0, x0

    j wordswap

done:
    add x0, x0, x0