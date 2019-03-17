@Create a program that will execute math problem
@it should be able to do bassic opperations
@ {+-*/ }
@I need to then return the answer to the opperand



.global _start


_start:						@main goal is get user to give me a number 
	mov r7, #4
	mov r0, #1
	mov r2, #34
	ldr r1, =promptnumber
	swi 0

read:						@read in the value	
	mov r7, #3
	mov r0, #0
	mov r2, #1
	str r1, num1;			@having issues with getting it to work Maybe switching back to ldr & add swi 0?

prompt2:
	mov r7, #4
	mov r0, #1
	mov r2, #34
	ldr r1, =promptOpperand
	swi 0

readopp:
	mov r7, #3
	mov r0, #0
	mov r2, #1
	str r1, opp;

prompNum2:
	mov r7, #4
	mov r0, #1
	mov r2, #34
	ldr r1, =promptnumber
	swi 0

getNum2:
	mov r7, #3
	mov r0, #0
	mov r2, #1
	str r1, num2

decide:
	ldr r1, =opp
	ldr r0, =num1
	ldr r2, =num2

	mov r7, #4
	mov r0, #1
	mov r2, #3
	
	cmp r1, #49
	BEQ addition
	cmp r1, #50
	beq subtraction
	cmp r1, #51
	beq multiplication
	cmp r1, #52
	beq division
	b end

	

write:
	mov r7, #4
	mov r0, #1
	mov r2, #3
	
addition:
	ldr r1, =addmsg
	swi 0
	b end
subtraction:
	ldr r1, =submsg
	swi 0
	b end
multiplication:
	ldr r1, =mulmsg
	swi 0
	b end
division:
	ldr r1, =divmsg
	swi 0
	
	
end:	
	mov r7,	#1
	swi 0 
	
.data
promptnumber: .ascii "Please enter a non-negative number."
promptOpperand: .Ascii "Please Enter 1. for +. 2. for -. 3. for *. 4. for /."
num1: .space 255
num2: .space 255
opp: .space 255
addmsg: .ascii "Add"
submsg: .ascii "sub"
mulmsg: .ascii "mul"
divmsg: .ascii "div"




