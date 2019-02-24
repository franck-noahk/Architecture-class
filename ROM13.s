@Goal: create a program that encripts a string given by 
@the user, and returns it to the command line in ROT13


.global _start

_start:				@start should print the prompt
	mov r7, #4
	mov r0, #1
	mov r2, #22
	ldr r1, =prompt
	swi 0			@I am currently getting an error on 
					@section of code it works for Willi's 
					@but not mine
read:
	mov r7, #3
	mov r0, #0
	mov r2, #256
	ldr r1, =string
	swi 0
.data
prompt: .ascii "Please enter a String:"
string: .space 256



