@Create a program that will execute math problem
@it should be able to do bassic opperations
@ {+-*/ }
@I need to then return the answer to the opperand



.global _start


_start:						@main goal is get user to give me a number 
	mov r7, #4
	mov r0, #1
	mov r2, #36
	ldr r1, =promptnumber
	swi 0

read:						@read in the value	
	mov r7, #3
	mov r0, #0
	mov r2, #10
	ldr r1, =num1;			@having issues with getting it to work Maybe switching back to ldr & add swi 0?
	swi 0
prompt2:
	mov r7, #4
	mov r0, #1
	mov r2, #53
	ldr r1, =promptOpperand
	swi 0
readOpperand:
	mov r7, #3
	mov r0, #0
	mov r2, #2
	ldr r1, =opp;			
	swi 0
	mov r10, r1
write:
	mov r7, #4
	mov r0, #1
	mov r2, #36
	ldr r1, =promptnumber
	swi 0
readnum2:						@read in the value	
	mov r7, #3
	mov r0, #0
	mov r2, #10
	ldr r1, =num2;			@having issues with getting it to work Maybe switching back to ldr & add swi 0?
	swi 0
	@ldr r9, [r1]	@does nothing	
	mov r5, #49 	@comparison opperaotr
	ldrb r9, [r1, #0]  @moves first number of 	
	ldr r12, =num1
	ldrb r11, [r12, #0]
decimalToString:
	mov r7, #0		@ counter/ index
	mov r0, #0		@math num 1
	mov r2, #0		@math num 2
	
loop:
	cmp r1, #0
	beq writeEnd
	sub r9, #48
	sub r11, #48
	add r2, r2, r9
	add r0, r0, r11	
	add r7, r7, #1
	ldrb r9, [r1,r7]
	b loop






writeEnd:
	mov r12, r0
	mov r11, r2
	mov r7, #4
	mov r0, #1
	mov r2, #3

comparison:
	ldrb r1, [r10, #0] @how to write a program
	cmp r1, r5
	BEQ addition
	add r5, r5, #1
	cmp r1, r5
	beq subtraction
	add r5, r5, #1
	cmp r1, r5
	beq multiplication
	add r5, r5, #1
	cmp r1, r5
	beq division
	add r5, r5, #1
	b end
	
addition:
	add r1, r12, r11	
	swi 0
	b end
subtraction:
	sub r1, r11, r12
	swi 0
	b end
multiplication:
	mul r1, r11, r12
	mulmsg
	swi 0
	b end
division:
	ldr r1, =divmsg
	swi 0
	
	
end:	
	mov r7,	#1
	swi 0 
	
.data
	promptnumber: .ascii "Please enter a non-negative number.\n"
	promptOpperand: .Ascii "Please Enter 1. for +. 2. for -. 3. for *. 4. for /.\n"
	num1: .space 255
	num2: .space 255
	opp: .space 255
	addmsg: .ascii "Add"
	submsg: .ascii "sub"
	mulmsg: .ascii "mul"
	divmsg: .ascii "div"

	out: .space 255
