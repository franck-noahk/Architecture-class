
.global _start

_start:
	MOV R7, #4 
	MOV R0, #1 	@write to console
	MOV R2, #22	 @22 characters
	LDR R1, =prompt
	SWI 0

read:
	MOV R7, #3
	MOV R0, #0
	MOV R2, #64
	LDR R1, =string 	@LDR means load register
	SWI 0
	MOV R4, #0	 @counter
	MOV R5, #0	 @array index
	ldr R9, =newstring

counter:
	LDRB R8, [R1, R4] 
	CMP R8, #0
	BEQ loop 

increment:
	ADD R4, R4, #1
	B counter

store:
	MOV R6, R4
	SUB R6, R6, #1
	MOV R4, #0

loop:
	LDRB R8, [R1, R6]
	STRB R8, [R9, R5] 	@stores register into byte
	SUB R6, R6, #1
	CMP R6, #0
	BEQ write
	b loop

write:
	MOV R7, #4
	MOV R0, #1
	MOV R2, #255
	LDR R1, =newstring 	@load pointer to string in R1
	SWI 0

end:
	MOV R7, #1
	SWI 0

.data

prompt: .ascii "Please enter a string:"

string: .space 256

newstring: .space 256
