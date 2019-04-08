//Program to test function calls

.data
    .balign 4
    greetings: .asciz "Hello, World!"
    .balign 4
    return: .word 0    //returning in c to make it happy
    .balign 4
    num1: .word 0       //for scanf
    .balign 4
    format_string: .asciiz "%d"
.text

.global main

main:

    ldr r0, address_of_return   //loads address of load value
    str lr, [r1]                //store current link address into r1

    ldr r0, address_of_greeting //make r0 pointer to greeting
    BL printf

    LDR r0, address_of_format_string
    ldr r1, address_of_num1
    bl scanf

    ldr r0, address_of_num1
    
    bl printf

    ldr r1, address_of_return   //make r1 a pointer to return
    ldr lr, [r1]                //store value of r1 into r1
    bx lr

address_of_return: .word return
address_of_greeting: .word greeting
address_of_num1: .word num1
address_of_num2: .word num2

.global puts