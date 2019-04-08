@Program to test function calls

.data
    greetings: .asciz "Hello, World!"
.text

.global main

main:
    ldr r0, greeting
    str lr, [r1]

    bl puts

    ldr lr, [r1]
    bx lr

.global puts