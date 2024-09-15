lui s1,7245 #Loading the decimal integer 7245 into s1
addi s1,s1,-1578 #Adding the decimal number -1578 to s1, storing in s1
lui s2,0x7aaaa #Loading the hex integer 0x7aaaa into s1
addi s2,s2,0x7aa #Adding the hex integer 0x7aa to s2, storing in s2
and s3, s1, s2 #bitwise ANDing 21 and s2, storing result in s3 
or s4, s1, s2 #bitwise ORing s1 and s2, storing result in s4
xor s5, s1, s2 #bitwise XORing s1 and s2, storing result in s5
slli s6,s1,7 #shifting bits of s1 left by 7, storing result in s6 (unsigned)
srli s7,s6,7 #shifting bits of s6 right by 7, storing result in s7 (unsigned)
srai s8,s6,7 #shifting bits of s6 right by 7, storing result in s8 (signed)
sw s1,0x00(gp) #substitue gp by sp for stack
sw s2,0x04(gp) #
sw s3,0x08(gp)
sw s4,0x0C(gp)
sw s5,0x10(gp)
sw s6,0x14(gp)
sw s7,0x18(gp)
sw s8,0x1C(gp)
add x0,x0,x0