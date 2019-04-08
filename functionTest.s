//Program to test function calls

.data
    greetings: .asciz "Hello, World!"
    return : .word 0    //returning in c to make it happy
    .balign 4
.text

.global main

main:

    ldr r0, address_of_return   //loads address of load value
    str lr, [r1]                //store current link address into r1

    ldr r0, address_of_greeting //make r0 pointer to greeting

    bl puts

    ldr r1, address_of_return   //make r1 a pointer to return
    ldr lr, [r1]                //store value of r1 into r1
    bx lr

address_of_return: .word return
address_of_greeting: .word greeting


.global puts