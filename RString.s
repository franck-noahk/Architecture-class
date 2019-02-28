@Goal: Create a program that accepts a string from a user
@Goal: Reverse the string of and give it back to the user by the command line

.global _start


_start:
	mov r7, #4
	mov r0, #1
	mov r2, #22
	ldr r1, =prompt
	swi 0

read:
	mov r7, #3
	mov r0, #0
	mov r2, #255
	ldr r1, =orig
	swi 0
	mov r4, #255	@index start at end
	mov r5, #255	@ code for nonbreaking space
	ldr r6, =new
	ldr r10, =one
	mov r9, #0		@second index for new string
loop:
	CMP r4, #0		@breaks out of loop
	BEQ write
	LDRB r8, [r1, r4]	@moves index (r4) of r1 into r8
	CMP r8, r10
	BGE skip
	BGE save
	
skip: 
	SUB r4, r4, #1
	b loop
save:
	LDRB r6, [r1, r9]
	ADD r9, r9, #1
	SUB r4, r4, #1
	b loop

write:
	mov r7, #4		@should write out the new string into the command prompt
	mov r0, #1
	mov r2, #255
	ldr r1, =new
	SWI 0
end:
	mov r7, #1
	swi 0


.data
prompt: .ascii "Plase enter a String:"
orig: .space 255
new: .space 255
one: .space 1
