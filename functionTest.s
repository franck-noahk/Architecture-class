//Program to test function calls

.data
    greetings: .asciz "Hello, World!"
    return : .word 0    //returning in c to make it happy
    .balign 4
.text

.global main

main:
    ldr r0, greeting
    str lr, [r1]

    bl puts

    ldr lr, [r1]
    bx lr

.global puts