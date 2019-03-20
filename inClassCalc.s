@ This program will perform one of the 4 basic arithmatic operations on 2 user provided numbers

.global _start

_start:
	MOV R7, #4		@these 5 lines print  prompt1
	MOV R0, #1
	MOV R2, #43
	LDR R1, =prompt1
	SWI 0

	MOV R7, #3		@these 5 lines read 5 chars from keyboard for num1
	MOV R0, #0
	MOV R2, #5
	LDR R1, =num1		@load address for user input string
	SWI 0

	MOV R7, #4		@these 5 lines print  prompt2
	MOV R0, #1
	MOV R2, #49
	LDR R1, =prompt2
	SWI 0

	MOV R7, #3		@these 5 lines read 5 chars from keyboard for num2
	MOV R0, #0
	MOV R2, #5
	LDR R1, =num2		@load address for user input string
	SWI 0

	MOV R7, #4		@these 5 lines print  prompt3
	MOV R0, #1
	MOV R2, #42
	LDR R1, =prompt3
	SWI 0

	MOV R7, #3		@these 5 lines read 1 chars from keyboard for operand
	MOV R0, #0
	MOV R2, #1
	LDR R1, =operand		@load address for user input string
	SWI 0


num1parse:
	MOV R2, #0		@index for string traversal
	MOV R6, #0		@initialize total
	LDR R1, =num1		@load first number
	MOV R10, #10		@10 but in a register

num1loop:
	LDRB R8, [R1, R2]	@load byte from string for num1
	CMP R8, #48		@is this the terminator
	BLT end
	MOV R7, R6		@temporary storage of total
	MUL R6, R7, R10		@multiply current total by 10 to make room for next digit
	SUB R8, R8, #48		@convert ascii to number
	ADD R6, R6, R8		@add digit to total
	ADD R2, R2, #1		@increment counter
	B num1loop		@loop because not end of string





write:
	MOV R7, #4		@these 5 lines print the total
	MOV R0, #1
	MOV R2, #32
	LDR R1, =total
	SWI 0

end:
	MOV R7, #1		@these two exit the program gracefully
	MOV R0, R6
	SWI 0

.data

prompt1: .ascii "Please enter a number between 0 and 65535: "		@the 1st prompt

prompt2: .ascii "Please enter another number between 0 and 65535: "		@the 2nd prompt

prompt3: .ascii "Please select an operand (+, -, *, or /): " @the operand prompt

num1: .space 5		@first number (which will go to R4)

num2: .space 5		@first number (which will go to R5)

operand: .space 1	@which operation

total: .space 32	@string for total
