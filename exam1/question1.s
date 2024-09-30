main:
    addi a0, x0, 7
    addi a1, x0, 11
    jal x1, recipfunc
    addi a0, x0, 3
    addi a1, x0, 13
    jal x1, recipfunc
    j done

recipfunc:
    add t3, x0, x0 # Clear t3 value each loop
    addi t0, x0, 1 # For bne check at line 20
    addi t1, t1, 1 # Multiplicand "x" increments each loop
    mul t3, a0, t1 # Mulltiply w by x

findmod:
    blt t3, a1, foundmod #when w<x, mod is found
    sub t3, t3, a1 #subtract x from w 
    jal x0, findmod # repeat subtraction until w<x
foundmod:
    bne t3, t0, recipfunc #loop if aMODb !=1
    add a0, x0, t1 # set return to "x"
    add t1, x0, x0 # Reset x for next function call
    jalr x0, 0(ra) #return to main

done:
    add x0, x0, x0