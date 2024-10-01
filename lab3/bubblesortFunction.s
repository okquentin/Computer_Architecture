# bubblesortFunction.s
# sarah.harris@unlv.edu
# October 2021
# Description: Sorts an N-element array from smallest to largest.
#
# Test case: sortarray = {-15,42,73,19,-8,24,16,-2,99,-78,-21,23,-88,49,-101} 
# sortarray spans addresses 0x400 to 0x438
#
# When the code completes, sortarray is:
# {-101,-88,-78,-21,-15,-8,-2,16,19,23,24,42,49,73,99}

 
initarray:
  addi a0, zero, 0x400
  addi t0, zero, -15
  sw   t0, 0(a0)
  addi t0, zero, 42
  sw   t0, 4(a0)
  addi t0, zero, 73
  sw   t0, 8(a0)
  addi t0, zero, 19
  sw   t0, 0xC(a0)
  addi t0, zero, -8
  sw   t0, 0x10(a0)
  addi t0, zero, 24
  sw   t0, 0x14(a0)
  addi t0, zero, 16
  sw   t0, 0x18(a0)
  addi t0, zero, -2
  sw   t0, 0x1C(a0)
  addi t0, zero, 99
  sw   t0, 0x20(a0)
  addi t0, zero, -78
  sw   t0, 0x24(a0)
  addi t0, zero, -21
  sw   t0, 0x28(a0)
  addi t0, zero, 23
  sw   t0, 0x2C(a0)
  addi t0, zero, -88
  sw   t0, 0x30(a0)
  addi t0, zero, 49
  sw   t0, 0x34(a0)
  addi t0, zero, -101
  sw   t0, 0x38(a0)
  addi a1, zero, 15
  jal  bubblesort 
  nop
  

# s0 = tmp, s1 = swapped
bubblesort:
  addi a1, a1, -1       # a1 = size-1
  slli t0, a1, 2        # t0 = (size-1) * 4 
  add  t0, a0, t0       # just past second to last element of array
  addi s1, zero, 1      # swapped = 1
L1:
  beq  s1, zero, done   # if (swapped == 0), done
  addi s1, zero, 0      # swapped = 0
  addi t3, a0, 0        # t3 = base address of sortarray[]
L2:
  bge  t3, t0, L1       # if i >= (size-1), end of for loop
  lw   s0, 0(t3)        # tmp = sortarray[i]
  lw   t1, 4(t3)        # t1 = sortarry[i+1]
  bge  t1, s0, L3       # if sa[i+1] >= sa[i], continue
  sw   t1, 0(t3)        # sortarray[i] = sortarray[i+1]
  sw   s0, 4(t3)        # sortarray[i+1] = tmp
  addi s1, zero, 1      # swapped = 1
L3:
  addi t3, t3, 4        # t3 = address of next element in array
  j    L2
done:
  jr   ra               # return
