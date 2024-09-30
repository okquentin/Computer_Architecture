concat:
    # Arguments are the base addresses of each char string
    # a0 = string1, a1 = string2, a2 = stringconcat

    # Track elements of each string
    # t0 = string1[i], t1 = string2[i], t2 = stringconcat[i]
    lb t0, 0(a0)
    lb t1, 0(a1)
    lb t2, 0(a2)

add_string1:
    beq t0, x0, add_string2
    sb t0, 0(a0)
    add a0, a0, 1
    add a2, a2, 1
    j concat

add_string2:
    beq t1, x0, return
    sb t1, 0(a1)
    add a1, a1, 1
    add a2, a2, 1
    j concat
return:
    sb x0, 1(a2)
    jr ra

main: 
     jal x1, concat

done:
    add x0, x0, x0