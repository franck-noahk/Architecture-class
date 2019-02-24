

.global _start

_start:
    mov R1, #5;
    mov r2, #10
    cmp r1, r2
    beq vals_equal 
    bgt r1_g2

r1_l2:
    mov r0, #2
    b end

r1_g2:
    mov r0, #3

vals_equal: 
    mov r0, #1

end:

