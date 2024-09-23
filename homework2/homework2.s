# a0 is the address of the first array element
# a1 is the size of the array
# a0 is also used for the function's return value
# would be defined in main, could be reversed and still work

function_find42:
    add t0, t0, x0 # Initalize t0 ("i")
    add t1, 42, x0 # Set t1 to expected value (42)

for:
    bge t0, a0, not_found # (branch if i>size)
    slli t2, t0, 2 # Shift index by 4 for address offset
    add t2, a0, t2 # Add offset to base address (a0)
    lw t2, 0(t2) # Load the value of the array element
    beq t2, t1, found # Branch if the expected value (42) was found
    addi t0, t0, 1 # Increment i (t0)
    j for # Repeat loop

found:
    addi a0, x0, t0 # Set a0 to the value of "i" if found
    j done

not_found:
    addi a0, x0, -1 # Set a0 to -1

done:
    jr ra # Set PC back to memory location where funciton was called