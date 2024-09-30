main:
    addi a0, x0, 0
    jal sumn
    addi a0, x0, 1
    jal sumn
    addi a0, x0, 2
    jal sumn
    addi a0, x0, 5 # Setting an integer "n" (a0)
    jal sumn # Initial function call
    addi a0, x0, 10
    jal sumn
    j done

sumn: #a0 = n
    addi sp, sp, -8 # make room for a0 & ra
    sw a0, 4(sp) # Store a0
    sw ra, 0(sp) # Store ra
    bgt a0, x0, else # if n>0, go to else
    add a0, x0, x0 # otherwise, return 0
    addi sp, sp, 8
    jalr x0, 0(ra) # will jump to line 16+1 (17)
else:
    addi a0, a0, -1 # a0 = n-1
    jal sumn # Recursive function call
    lw t1, 4(sp) # restore n into t1
    lw ra, 0(sp) # restore ra
    addi sp, sp, 8 #restore sp
    mul t1, t1, t1 # t1 = n^2 
    add a0, t1, a0 # a0 = n^2 + sumn(n-1)
    jalr x0, 0(ra) # will jump to line 16+1 or line 3+1

done:
    add x0, x0, x0