//Program to test function calls

.data
    .balign 4
    greeting: .asciz "Please insert a number that will be multiplied by 5.\n"
    .balign 4
    return: .word 0    //returning in c to make it happy
    .balign 4
    num1: .word 0       //for scanf
	.balign 4 
	num2: .word 0
    .balign 4
    format_output: .ascii "%d\n"
    .balign 4
    format_string: .ascii "%d"
.text

multiply5: 
    add r1, r0, r0              // times 2
    add r1, r1, r0              // times 3
    add r1, r1, r0              // times 4
    add r1, r1, r0              // times 5
    mov r0, r1                  //moving return values to r0
    bx lr          	//Unsure if bx is right here, ask Willie            //way to leave the code

.global main

main:

    ldr r0, address_of_return   //loads address of load value
    str lr, [r1]                //store current link address into r1
    ldr r0, address_of_greeting //make r0 pointer to greeting
    BL printf
    LDR r0, address_of_format_string
    ldr r1, address_of_num1
    bl scanf
    //-----------------multiply by 5 ---------------------
    ldr r0, address_of_num1
    ldr r0, [r0]
    bl multiply5                //go and see multiply5
    mov r1, r0                  //getting ready for next printf
    ldr r0, address_of_format_output     // loading r0 with address for printf
    //-----------------multiply function call endend -----------------------
    bl printf
    ldr r1, address_of_return   //make r1 a pointer to return
    ldr lr, [r1]                //store value of r1 into r1
    bx lr
	mov r7, #1
	swi 0


address_of_return: .word return
address_of_greeting: .word greeting
address_of_num1: .word num1
address_of_num2: .word num2
address_of_format_string: .word format_string
address_of_format_output: .word format_output

.global puts
